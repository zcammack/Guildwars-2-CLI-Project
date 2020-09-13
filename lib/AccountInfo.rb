class Account

    @@all = []

    attr_accessor :global, :age, :guilds, :version, :characters

    def initialize(account, char_hash)
        self.global = account["name"]
        self.age = account["age"]
        self.version = account["access"]
        @characters = []
        @guilds = []
        add_characters(char_hash, self.global)
        add_guilds(account["guilds"])
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def add_characters(char_hash, global)
        char_hash.collect do | character |
            new_character = Character.new(character, global)
            @characters << new_character
        end
    end

    def add_guilds(guild_data)
        guild_data.each do | guild |
            resp = RestClient.get("https://api.guildwars2.com/v1/guild_details?guild_id=#{guild}")
            guild_hash = JSON.parse(resp.body)
        end
        guild_hash.collect do | guild |
            new_guild = Guild.new(guild)
            @guilds << new_guild
        end
    end
end