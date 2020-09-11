class Bank

    attr_accessor :content

    @@all = []

    def initialize
        content = []
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

end