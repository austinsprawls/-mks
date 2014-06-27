class Car

    def get_info
        "I'm a car! I've driven #{@distance} miles and have #{@fuel} gallons of gas left."
    end

    def initialize
        @fuel = 10
        @distance = 0

        puts "the initialize method is running automatically"
    end

    def drive(miles)
        @distance += miles
        @fuel -= (1/20.0)*miles
    end

    def fuel_up
        cost = 0
        while @fuel < 10
            cost += 1.75
            @fuel += 0.5
        end
        puts "Gas will cost you $#{cost}"
    end

end

car_a = Car.new
car_b = Car.new
car_a.drive(500)
puts car_a.get_info
puts car_b.get_info
puts Car.total_car_count
c1 = Car.new
puts Car.total_car_count
c2 = Car.new
puts Car.total_car_count

best_color = Car.most_popular_color
Car.new(best_color)
