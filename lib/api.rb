require_relative 'account'
require 'rest-client'
require 'json'
require 'pry'

resp = RestClient.get('https://api.guildwars2.com')

binding.pry