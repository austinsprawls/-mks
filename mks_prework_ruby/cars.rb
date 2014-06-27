class Car

	@@total_car_count = 0

	@@cars_per_color = {"red" => 0}

	def self.total_car_count
		@@total_car_count
	end

	def to_s()
		"I'm a car! I've driven #{@distance} miles and have #{@fuel} gallons gas left"
	end

	def initialize(color)
		@color = color
		@fuel = 10
		@distance = 0
		if @@cars_per_color.has_key?(@color)
			@@cars_per_color.each do |k,v|
				@@cars_per_color[k] += 1 if k == @color
			end
		else
			@@cars_per_color[@color] = 1
		end
		@@total_car_count += 1
	end

	def color=(new_color)
		@@cars_per_color.each do |k,v|
			@@cars_per_color[k] -= 1 if k == @color
 		end
		@color = new_color
		@@cars_per_color.each do |k,v|
			@@cars_per_color[k] += 1 if k == @color
		end
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end

	def self.most_popular_color
		puts "The most popular color car is #{@@cars_per_color.key(@@cars_per_color.values.max)}"
	end

	def self.total_car_count
		puts "There are #{@@total_car_count} cars total"
	end
end

car_a = Car.new("red")
car_b = Car.new("green")
car_c = Car.new("green")
puts car_a
puts car_b
car_a.drive(10)
puts car_a
puts car_b
car_a.drive(232)
car_b.drive(117)
puts car_a
puts car_b
puts Car.most_popular_color
puts Car.total_car_count
