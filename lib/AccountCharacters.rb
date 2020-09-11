class Character

    @@all = []

    attr_accessor :global, :name, :race, :gender, :level, :profession

    def initialize(character)
        self.name = character["name"]
        self.race = character["race"]
        self.gender = character["gender"]
        self.level = character["level"]
        self.profession = character["profession"]
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

end