class Account

    @@all = []

    attr_accessor :name, :id, :guilds, :edition

    def initialize(global)
        self.name = global["name"]
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