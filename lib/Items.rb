class Items

    attr_accessor :name, :type, :description, :level

    @@all = []

    def initialize(item)
        self.name = ["name"]
        self.type = ["type"]
        self.description = ["description"]
        self.level = ["level"]
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

end