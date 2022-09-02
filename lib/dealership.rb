class Dealership
    attr_reader :inventory, :address

    def initialize(name, address)
        @name = name
        @address = address
        @inventory = []
    end

    def inventory_count
        inventory.length
    end

    def add_car(car)
        @inventory.push(*car)
    end

    def has_inventory?
        @inventory.length > 0
    end

    def cars_by_make(makes)
        x = 0
        make_match = []
        inventory_count.times do
            if inventory[x].make == makes
                make_match << inventory[x]
            end
            x += 1
        end
        make_match
    end

    def total_value
        x = 0
        cars_value = 0
        inventory_count.times do
            cars_value += inventory[x].total_cost 
            x += 1
        end
        cars_value
    end

    def details
        {"total_value" => total_value, "address" => @address}
    end

end