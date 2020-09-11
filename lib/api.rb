
require 'rest-client'
require 'json'
require 'pry'

require_relative 'api'
require_relative 'AccountCharacters'
require_relative 'AccountInfo'
class API

    def self.scrape_account
        resp1 = RestClient.get('https://api.guildwars2.com/v2/characters?access_token=9BBC841D-8BD6-444C-A381-7F377D5F2FDC431AA622-52A5-40DC-B9B7-6470A1F0BFBC&page=page=0')

        char_hash = JSON.parse(resp1.body)

        resp2 = RestClient.get('https://api.guildwars2.com/v2/account?access_token=9BBC841D-8BD6-444C-A381-7F377D5F2FDC431AA622-52A5-40DC-B9B7-6470A1F0BFBC')

        account_hash = JSON.parse(resp2.body)

        Account.new(account_hash, char_hash)
    end

end