require 'rubygems'
require 'bundler/setup'
require 'sinatra'

require 'net/http'
require 'net/https'
require 'yaml'
require 'json'
require 'pry'

get '/pool.txt' do
  if locked?
    switch_pool(locked_config['abbr'])
  else
    switch_pool(best_to_mine) unless already_mining_best?
  end
  erb :pool, content_type: 'text/plain', layout: false
end

get '/status' do
  currently_mining
end

def already_mining_best?
  best_to_mine == currently_mining
end

def currently_mining
  YAML::load_file('current.yml')['currently_mining']
end

def config
  YAML::load_file('config.yml')
end

def current_config
  @current_config ||= config['coins'].select { |c| c['abbr'] == currently_mining }.first
end

def locked_config
  @current_config ||= config['coins'].select { |c| c['locked'] == true }.first
end

def locked?
  !!locked_config
end

private

def pool_configured?(coin)
  config['coins'].select { |c| c['abbr'] == coin }.count > 0
end

def switch_pool(coin_to_mine)
  return unless pool_configured?(coin_to_mine)

  current = YAML::load_file('current.yml')
  current['currently_mining'] = coin_to_mine
  File.open('current.yml', 'w') { |f| f.write current.to_yaml }
end

def best_to_mine
  @best_to_mine ||= what_to_mine['tag']
end

def what_to_mine_url
  config['whattomine_url']
end

def what_to_mine
  uri = URI(what_to_mine_url)

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  req =  Net::HTTP::Get.new(uri)

  res = http.request(req)
  json_res = JSON.parse(res.body)

  # get the key of the best coin to mine so we can
  # get all the data
  # TODO get next best if not configured
  json_res['coins'][json_res['coins'].keys.first]
rescue StandardError => e
  puts "HTTP Request failed (#{e.message})"
  # continue on
  currently_mining
end
