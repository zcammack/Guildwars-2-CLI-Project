require_relative 'AccountCharacters'
require_relative 'AccountInfo'
require_relative 'BankInfo'
require_relative 'MaterialInfo'
require 'rest-client'
require 'json'
require 'pry'

#This statement is issuing a GET request to the GW2 API. This request is required to have an access token, which is an API Key associated with an account.

resp = RestClient.get('https://api.guildwars2.com/v2/characters?access_token=9BBC841D-8BD6-444C-A381-7F377D5F2FDC431AA622-52A5-40DC-B9B7-6470A1F0BFBC&page=page=0')

#Due to the way the API is organized, we now have an array of hashes. Each hash represents a character and it's associated attributes.
#We can, for example, call gw2_hash[0]["name"] and recieve the return 'Sebastion Savio'.

char_hash = JSON.parse(resp.body)


#The following is using #collect as a means to iterate over each array within
#this hash. Each array is then stored as an object with our Character class.

account_characters = char_hash.collect do | character |
    Character.new(character)
endq

#The following is to build out information for Basic Account Info.

resp = RestClient.get('https://api.guildwars2.com/v2/account?access_token=9BBC841D-8BD6-444C-A381-7F377D5F2FDC431AA622-52A5-40DC-B9B7-6470A1F0BFBC')

account_hash = JSON.parse(resp.body)

Account.new(account_hash)


#The following is to build out Account Bank Information.

resp = RestClient.get('https://api.guildwars2.com/v2/account/bank?access_token=9BBC841D-8BD6-444C-A381-7F377D5F2FDC431AA622-52A5-40DC-B9B7-6470A1F0BFBC')

bank_hash = JSON.parse(resp.body)

Bank.new.content = bank_hash


#The following is to build out Account Material Bank Information.

resp = RestClient.get('https://api.guildwars2.com/v2/account/materials?access_token=9BBC841D-8BD6-444C-A381-7F377D5F2FDC431AA622-52A5-40DC-B9B7-6470A1F0BFBC')

material_hash = JSON.parse(resp.body)

Material.new.content = material_hash
binding.pry
