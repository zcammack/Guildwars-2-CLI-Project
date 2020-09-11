class Account

    @@all = []

    attr_accessor :global, :id, :guilds, :edition, :characters

    def initialize(account, char_hash)
        self.global = account["name"]
        self.id = account["id"]
        self.guilds = account["guilds"]
        self.edition = account["access"]
        @characters = []
        add_characters(char_hash, self.global)
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
end