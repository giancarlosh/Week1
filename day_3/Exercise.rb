#un coche un motor

class Car
	def initialize engine, noise
		@engine=engine
		@noise=noise
	end
	def make_noise
		puts "#{@noise}#{@engine.make_noise}" 
	end
end
class Engine
	def initialize noise
		@noise=noise
	end
	def make_noise
		@noise
		
	end

end
motor=Engine.new "BRUUUUUU"



car=Car.new motor, "PIIIIIII"


puts car.make_noise