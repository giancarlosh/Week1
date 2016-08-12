class Car
  def initialize sound
    @sound = sound
    @cities = load_cities
  end

  def visit_city city
    if !@cities.empty?
      city = ",#{city}"
    end
    @cities << city

    IO.write("cities.txt", @cities.join)
  end

  def cities
    @cities = load_cities
  end

  def load_cities
    IO.read("cities.txt").split(',')
  end

  def make_noise
    puts @sound
  end

  def self.speed_control
    puts "Velocidad: "
    speed = gets.chomp.to_i
    if speed > 100
      puts "Tu velocidad es de #{speed}. Deberias ir mas despacio"
    end 
  end
end

car = Car.new "BROOMM"
another_car = Car.new "Mec-Mec"

# car.make_noise
# Car.speed_control

car.visit_city "Madrid"
car.visit_city "Madrid"
car.visit_city "Madrid"
car.cities.each{|city| puts city}
