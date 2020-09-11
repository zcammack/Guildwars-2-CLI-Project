require_relative 'AccountCharacters'
require_relative 'AccountInfo'
require 'rest-client'
require 'json'
require 'pry'

#This statement is issuing a GET request to the GW2 API. This request is required to have an access token, which is an API Key associated with an account.

resp = RestClient.get('https://api.guildwars2.com/v2/characters?access_token=9BBC841D-8BD6-444C-A381-7F377D5F2FDC431AA622-52A5-40DC-B9B7-6470A1F0BFBC&page=page=0')

#Due to the way the API is organized, we now have an array of hashes. Each hash represents a character and it's associated attributes.
#We can, for example, call gw2_hash[0]["name"] and recieve the return 'Sebastion Savio'.

char_hash = JSON.parse(resp.body)


#The following is using #collect as a means to iterate over each item within
#this array. Each array is then stored as an object with our Character class.

account_characters = char_hash.collect do | character |
    Character.new(character)
end

#This next method assigns attributes to each character object, giving them meaning.

account_characters.each do |toon|
    toon.race = "race"
    toon.gender = "gender"
    toon.profession = "profession"
    toon.level = "level"
end

resp = RestClient.get('https://api.guildwars2.com/v2/account?access_token=9BBC841D-8BD6-444C-A381-7F377D5F2FDC431AA622-52A5-40DC-B9B7-6470A1F0BFBC')

account_hash = JSON.parse(resp.body)

#This is currently not working. We have integers in this hash that need to be converted.

account_info = account_hash.collect do | global |
    Account.new(global)
    binding.pry
end

account_info.each do | data |
    data.name = "name"
    data.guilds = "guilds"
    data.edition = "access"
end