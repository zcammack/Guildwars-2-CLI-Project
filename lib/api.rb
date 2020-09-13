class API

    def self.scrape_account(apikey)

        resp1 = RestClient.get("https://api.guildwars2.com/v2/characters?access_token=#{apikey}&page=page=0")

        char_hash = JSON.parse(resp1.body)
                            
        resp2 = RestClient.get("https://api.guildwars2.com/v2/account?access_token=#{apikey}")

        account_hash = JSON.parse(resp2.body)

        Account.new(account_hash, char_hash)
    end

end

