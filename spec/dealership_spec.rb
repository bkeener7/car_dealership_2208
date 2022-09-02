require 'rspec'
require './lib/car'
require './lib/dealership'

RSpec.describe Dealership do

     it 'exists' do
        dealership = Dealership.new("Acme Auto", "123 Main Street")

        expect(dealership).to be_a(Dealership)
    end

    it 'by default has no inventory' do
        dealership = Dealership.new("Acme Auto", "123 Main Street")
        
        expect(dealership.inventory).to eq([])
        expect(dealership.inventory_count).to eq(0)
    end

    it 'receives inventory' do
        dealership = Dealership.new("Acme Auto", "123 Main Street")
        car_1 = Car.new("Ford Mustang", 1500, 36)
        car_2 = Car.new("Toyota Prius", 1000, 48)

        dealership.add_car(car_1)
        dealership.add_car(car_2)
        expect(dealership.inventory).to eq([car_1, car_2])
        expect(dealership.inventory_count).to eq(2)
    end

    it 'can check inventory' do
        dealership = Dealership.new("Acme Auto", "123 Main Street")

        expect(dealership.has_inventory?).to eq(false)

        car_1 = Car.new("Ford Mustang", 1500, 36)
        car_2 = Car.new("Toyota Prius", 1000, 48)
        car_3 = Car.new("Toyota Tercel", 500, 48)
        car_4 = Car.new("Chevrolet Bronco", 1250, 24)
        
        dealership.add_car([car_1, car_2, car_3, car_4])
        expect(dealership.has_inventory?).to eq(true)
    end

    it 'can search cars by make' do
        dealership = Dealership.new("Acme Auto", "123 Main Street")
        car_1 = Car.new("Ford Mustang", 1500, 36)
        car_2 = Car.new("Toyota Prius", 1000, 48)
        car_3 = Car.new("Toyota Tercel", 500, 48)
        car_4 = Car.new("Chevrolet Bronco", 1250, 24)
        dealership.add_car([car_1, car_2, car_3, car_4])

        expect(dealership.cars_by_make("Toyota")).to eq([car_2, car_3])     
    end

    it 'can return total value of dealership' do
        dealership = Dealership.new("Acme Auto", "123 Main Street")
        car_1 = Car.new("Ford Mustang", 1500, 36)
        car_2 = Car.new("Toyota Prius", 1000, 48)
        car_3 = Car.new("Toyota Tercel", 500, 48)
        car_4 = Car.new("Chevrolet Bronco", 1250, 24)
        dealership.add_car([car_1, car_2, car_3, car_4])

        expect(dealership.total_value).to eq(156000)

    end

    it 'lists details of dealership' do
        dealership = Dealership.new("Acme Auto", "123 Main Street")
        car_1 = Car.new("Ford Mustang", 1500, 36)
        car_2 = Car.new("Toyota Prius", 1000, 48)
        car_3 = Car.new("Toyota Tercel", 500, 48)
        car_4 = Car.new("Chevrolet Bronco", 1250, 24)
        dealership.add_car([car_1, car_2, car_3, car_4])

        expect(dealership.details).to eq({"total_value" => dealership.total_value, "address" => dealership.address})
    end

end