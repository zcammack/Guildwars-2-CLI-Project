class Character

    @@all = []

    attr_accessor :name, :race, :gender, :level, :profession

    def initialize(character)
        self.name = character["name"]
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

end