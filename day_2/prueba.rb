class Car
	def initialize noise
		@noise=noise
		# @cities=load_cities
		
	end
	def make_noise
		puts @noise
	end
	def self.speed_control
		speed=gets.chomp.to_i
		if speed>100
			puts "fdbasmdbsad"
		end
	end
	# def visit_city city
	# 	if @cities
	# 		city=",#{city}"
	# 	end
	# 	@cities<<city
	# 	IO.write("cities.txt",@cities.join)
	# 	#@city_array.push city
	# end
	# def cities
	# 	@cities=load_cities
	# 	#puts @city_array
	# end
	# def load_cities
	# 	IO.read("cities.txt").split(,)
	# end

end

car=Car.new "Broom"
car.make_noise
# car.visit_city"MAdrid"
# car.visit_city"Barcssssruelona"

# car.cities

class Racing_car < Car
	def initialize noise
		@noise="BROuOM"
	end
end
rc=Racing_car.new "sadasdsaadsasd"
rc.make_noise

class Person 
	attr_reader :name
	def initialize name,age
		@name=name
		@age=age
	end
end
p=Person.new "luis",32
puts p.name

