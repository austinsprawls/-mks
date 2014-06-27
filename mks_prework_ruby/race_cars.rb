class RaceCars
  attr_reader :car_num, :name

  def initialize(car_num, name)
    @car_num = car_num
    @name = name
  end

end

class RaceTracks

  def initialize(race_cars)
    @race_cars = race_cars
  end

  def start_race
    @hour = 0
    @speed_hash = {}
    @dist_hash = Hash.new {|hash, key| hash[key] = 0}
    @race_cars.each {|car| @speed_hash[car] = rand(60..80)}
    puts "The race has begun!\n"
    @speed_hash.each {|key, value| puts "#{key.name} is travelling #{value} MPH!"}
    puts ""
  end

  def fast_forward
    @hour += 1
    if @hour <= 5
      @race_cars.each {|car| @dist_hash[car] += @speed_hash[car]}
      @race_cars.each {|car| @speed_hash[car] += rand(0..20)}
      @dist_hash.each {|key, value| puts "#{key.name} has travelled #{value} miles! #{5-@hour} hours left in the race."}
      puts ""
    elsif @hour > 5
      winner = @dist_hash.max_by {|k,v| v}
      puts "What a race! The winner is #{winner[0].name}, travelling a whopping #{winner[1]} miles!"
      puts "Please call start_race() to race again!"
    end
  end


end

red_rover = RaceCars.new(7, "Red Rover")
blue_betty = RaceCars.new(82, "Blue Betty")
purple_urkel = RaceCars.new(90, "Purple Urkel")

new_race = RaceTracks.new([red_rover, blue_betty, purple_urkel])
new_race.start_race
new_race.fast_forward
new_race.fast_forward
new_race.fast_forward
new_race.fast_forward
new_race.fast_forward
new_race.fast_forward
new_race.fast_forward
