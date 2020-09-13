class Guild

    @@all = []

    attr_accessor :name, :tag

    def initialize(guild)
        self.name = guild["guild_name"]
        self.tag = guild["tag"]
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end