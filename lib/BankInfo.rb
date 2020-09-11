class Bank

    attr_accessor :global, :id, :count, :binding

    @@all = []

    def initialize(item)
       self.id = item["id"]
       self.count = item["count"]
       self.binding = item["binding"]
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

end