class Account

    @@all = []

    attr_accessor :global, :id, :guilds, :edition

    def initialize(global)
        self.global = global["name"]
        self.id = global["id"]
        self.guilds = global["guilds"]
        self.edition = global["access"]
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end