hash={
	:wat => [0,1,{:wut =>[0,[[0,1,2,3,4,5,6,7,8,{:bbq => "rpta"}]]]}]

}
arr=[[0,1,2,3,4,{:secret=>{:unlock=>[0,"rpta"]}}]]


# puts hash [:wat][2][:wut][1][0][9][:bbq]
# puts arr [0][5][:secret][:unlock][1]

class Car
	attr_reader :brand,:model
	def initialize brand, model
		@brand=brand
		@model=model

	end
end

class Cardealer
	def initialize 
		@car_array={}
	end
	def add_car car
		{car.brand=>[car.model]}

	end
	def cars brand
		puts @car_array[brand.to_sym].[0]

	end
	
end
car_dealer=Cardealer.new
car1=Car.new("Ford","Fiesta")

car2=Car.new("Ford","Mustang")
car_dealer.add_car(car1)


car_dealer.cars("Ford")
