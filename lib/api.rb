require_relative 'account'
require 'rest-client'
require 'json'
require 'pry'

#This statement is issuing a GET request to the GW2 API. This request is required to have an access token, which is an API Key associated with an account.

resp = RestClient.get('https://api.guildwars2.com/v2/characters?access_token=9BBC841D-8BD6-444C-A381-7F377D5F2FDC431AA622-52A5-40DC-B9B7-6470A1F0BFBC&page=page=0')
gw2_hash = JSON.parse(resp.body)
binding.pry