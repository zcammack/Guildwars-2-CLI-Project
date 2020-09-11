class Account

    @@all = []

    attr_accessor :name, :guilds, :edition

    def initialize(global)
        self.name = global["name"]
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end