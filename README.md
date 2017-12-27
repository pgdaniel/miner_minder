# miner_minder
WIP!
Auto Select config file for ethos

Sample config

```yaml
---
whattomine_url: https://whattomine.com/coins.json?utf8=%E2%9C%93&adapt_q_280x=0&adapt_q_380=0&adapt_q_fury=0&adapt_q_470=0&adapt_q_480=3&adapt_q_570=0&adapt_q_580=0&adapt_q_vega56=0&adapt_q_vega64=0&adapt_q_750Ti=0&adapt_q_1050Ti=0&adapt_q_10606=0&adapt_q_1070=155&adapt_q_1080=0&adapt_q_1080Ti=38&eth=true&factor%5Beth_hr%5D=197.0&factor%5Beth_p%5D=405.0&factor%5Bgro_hr%5D=63.9&factor%5Bgro_p%5D=450.0&factor%5Bx11g_hr%5D=20.1&factor%5Bx11g_p%5D=420.0&factor%5Bcn_hr%5D=2190.0&factor%5Bcn_p%5D=330.0&eq=true&factor%5Beq_hr%5D=2000&factor%5Beq_p%5D=360.0&factor%5Blrev2_hr%5D=14700.0&factor%5Blrev2_p%5D=390.0&factor%5Bns_hr%5D=1950.0&factor%5Bns_p%5D=450.0&factor%5Blbry_hr%5D=315.0&factor%5Blbry_p%5D=525.0&factor%5Bbk2b_hr%5D=3450.0&factor%5Bbk2b_p%5D=630.0&factor%5Bbk14_hr%5D=5910.0&factor%5Bbk14_p%5D=570.0&factor%5Bpas_hr%5D=2100.0&factor%5Bpas_p%5D=405.0&factor%5Bskh_hr%5D=54.0&factor%5Bskh_p%5D=345.0&factor%5Bl2z_hr%5D=420.0&factor%5Bl2z_p%5D=300.0&factor%5Bcost%5D=0.1&sort=Profitability24&volume=0&revenue=24h&factor%5Bexchanges%5D%5B%5D=&factor%5Bexchanges%5D%5B%5D=abucoins&factor%5Bexchanges%5D%5B%5D=bitfinex&factor%5Bexchanges%5D%5B%5D=bittrex&factor%5Bexchanges%5D%5B%5D=bleutrade&factor%5Bexchanges%5D%5B%5D=cryptopia&factor%5Bexchanges%5D%5B%5D=hitbtc&factor%5Bexchanges%5D%5B%5D=poloniex&factor%5Bexchanges%5D%5B%5D=yobit&dataset=Main&commit=Calculate
coins:
  - abbr: ETH
    wallet: xxx
    miner_to_use: etherminer
    pool:
      name: ethdistro
      url_1: pool-usa.ethosdistro.com:5001
      url_2: pool-eu.ethosdistro.com:5001
      payout_threshold: 0.1
      status_url: https://api.nanopool.org/v1/eth/user/0x92ac112Ab7da45e9B1393616316E4E8686BCE848
      params: data, balance
  - abbr: HUSH
    wallet: xxx
    miner_to_use: ewbf-zcash
    pool:
      name: miningspeed
      url_1: mining.miningspeed.com:3052
      url_2:
      payout_threshold: 0.1
      status_url:
      params:
  - abbr: ZCL
    wallet: t1d73m5xew2mokBAiWq4sBR6YQsEknSnnhf
    miner_to_use: ewbf-zcash
    pool:
      name:
      url_1:
      url_2:
      payout_threshold:
      status_url:
      params:
```
