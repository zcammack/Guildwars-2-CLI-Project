class BankMaterials

    attr_accessor :global, :id, :count

    @@all = []

    def initialize(bank_materials)
        self.id = ["id"]
        self.count = ["count"]
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

end