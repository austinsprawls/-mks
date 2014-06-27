1.+(7)
Kernel.puts("Hello world")
Pet = Class.new
dog = Pet.new
Kernel.puts(dog)
class Pet
    def speak(sound)
        @sound = sound
        puts "My dog makes the sound #{@sound}"

    end
    def wag
        puts "wag wag"
    end
    def sit
        puts "plop"
    end
end

class Person
    def age(years)
        @age = years
    end
end

class Marker
    def set_color(my_color)
        @color = my_color
    end
    def write
        puts "I am writing with a #{@color} marker!"
    end
end

5.send(:*, 5)
"omg".send(:upcase)
['a', 'b', 'c'].send(:at, 1)
['a', 'b', 'c'].send(:insert, 2, 'o', 'h', 'n', 'o')
{}.send(:size)
{character: "Mario"}.send(:has_key?, :character)

6 - 32
{html: true, json: false}.keys
"MakerSquare" * 6
"MakerSquare".split('a')
['alpha', 'beta'][3]
