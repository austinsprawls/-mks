module Fight
    def punch(person, power)
        if power < 5
            puts "#{person.name} was punched by #{@name} with a power level of #{power}! #{person.scream} #{person.run}"
            person.caffeine_level -= 1
        else
            puts "#{person.name} was somersaulted into the air by #{@name} with a punch power level of #{power}!"
            person.caffeine_level -= 5
        end
    end
end

class Person

    attr_accessor :name, :caffeine_level

    def initialize(name, caffeine_level)
        @name = name
        @caffeine_level = caffeine_level
    end

    def run
        puts "#{@name} is making an escape now"
        return Person.new(@name, @caffeine_level)
    end

    def scream
        puts "AHHHH!"
        return Person.new(@name, @caffeine_level)
    end

    def drink_coffee
        @caffeine_level += 1
    end
end

class PowerRanger < Person

    include Fight

    attr_accessor :caffeine_level
    attr_reader :name, :strength, :color

    def initialize(name, caffeine_level, strength, color)
        super(name, caffeine_level)
        @strength = strength
        @color = color
    end

    def rest
    end

    def use_megazord(person)
        puts "#{person.name} was hit with the MegaZord!"
        person.caffeine_level -= 10
    end
end

class EvilNinja < Person

    attr_accessor :caffeine_level
    attr_reader :name, :strength, :evilness

    include Fight

    def initialize(name, caffeine_level, strength, evilness)
        super(name, caffeine_level)
        @strength = strength
        @evilness = evilness
    end

    def cause_mayhem(person)
        puts "#{@name} unleashed mayhem on #{person.name}! #{person.name}'s caffeine level is drained to zero!"
        person.caffeine_level = 0
    end
end

def fight_scene(power_ranger1, power_ranger2, evil_ninja1, evil_ninja2, person1, person2)
    power_ranger1.punch(evil_ninja1, 6)
    evil_ninja2.cause_mayhem(person1)
    person2.run.scream
    power_ranger2.use_megazord(evil_ninja2)
end

person1 = Person.new("Austin", 10)
person2 = Person.new("KC", 3)
power_ranger1 = PowerRanger.new("Ivan", 8, 76, "pink")
power_ranger2 = PowerRanger.new("Carl", 7, 88, "blue")
evil_ninja1 = EvilNinja.new("Santi", 4, 69, 100)
evil_ninja2 = EvilNinja.new("Daggi", 3, 53, 28)

puts fight_scene(power_ranger1, power_ranger2, evil_ninja1, evil_ninja2, person1, person2)
