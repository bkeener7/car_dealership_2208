class Dealership
    attr_reader :inventory

    def initialize(name, address)
        @name = name
        @address = address
        @inventory = []
    end

    def inventory_count
        inventory.length
    end

    def add_car(car)
        @inventory.push(car)
    end

end