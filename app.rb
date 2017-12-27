require 'rubygems'
require 'bundler/setup'
require 'sinatra'

require 'net/http'
require 'net/https'
require 'yaml'
require 'json'

CONFIG = YAML.load_file('config.yml')

get '/pool.txt' do
  # if pool_threshold_reached?
  #   if best_to_mine == currently_mining
  #     # keep mining what we are mining
  #     true
  #   else
  #     false
  #   end
  #
  # else
  #   # first check if we have that setup
  #   if pool_configured?(best_to_mine)
  #     switch_pool(best_to_mine)
  #   else
  #     "do nothing"
  #   end
  # end
  #
  #erb :pool, content_type: 'text/plain', layout: false

  what_to_mine['tag']
end

get '/status' do
  'ETH'
end

def currently_mining
  'ETH'
end

private

def what_to_mine_url
  CONFIG['whattomine_url']
end

def pool_threshold_reached?
  # check pool api if have enough for a payout
  true
end

def pool_configured?
  true
end

def best_to_mine
  # the abbr for the coin that's best to mine goes here
  'ETH'
end

def switch_miner(best_to_mine)
  # check if we have that in the config otherwise skip and go for another interation
  true
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
  json_res['coins'][json_res['coins'].keys.first]
rescue StandardError => e
  puts "HTTP Request failed (#{e.message})"
  # continue on
end
