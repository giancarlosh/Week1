class Home
	attr_reader(:name, :city, :capacity, :price)

	def initialize(name, city, capacity, price)
    	@name = name
    	@city = city
    	@capacity = capacity
    	@price = price
  	end
end
array_of_homes=[
	Home.new("Carlo's place","Madrid",8,60),
	Home.new("Marco's","Gran Canaria",5,90),
	Home.new("Jhon's place","Madrid",2,75),
	Home.new("Raul's place","Barcelona",5,60),
	Home.new("Ana's place","Madrid",3,85),
	Home.new("Andre's place","Gran Canaria",4,50),
	Home.new("Alejandro's place","Gran Canaria",5,70),
	Home.new("Paolo's place","Gran Canaria",11,55),
	Home.new("Maria's place","Madrid",7,90),
	Home.new("Luis's place","Barcelona",5,75),
]
#iteration 1
array_of_homes.each do |home|
	puts"#{home.name} in #{home.city} \nPrice: $#{home.price} a night"
end
#iteration 2
puts "what kind of order do you want for your search?"
puts "plh: sort by price (lowest to highest)"
puts "phl: sort by price (highest to lowest)"
puts "c: sort by capacity (lowest to highest)"
user_choose=gets.chomp.downcase
if user_choose=="plh"
	sorted=array_of_homes.sort_by{|home| home.price}
	sorted.each do |home|
		puts"#{home.name} in #{home.city} \nPrice: $#{home.price} a night"
	end
elsif user_choose=="phl"
	sorted=array_of_homes.sort_by{|home| home.price}.reverse
	sorted.each do |home|
		puts"#{home.name} in #{home.city} \nPrice: $#{home.price} a night"
	end
elsif user_choose=="c"
	sorted=array_of_homes.sort_by{|home| home.capacity}
	sorted.each do |home|
		puts"#{home.name} in #{home.city} \nPrice: $#{home.price} a night"
	end
else puts "choose an option from the list"
end
#iteration 3
puts "which city do you prefer"
puts "m: Madrid \nb:Barcelona \ng:Gran Canaria"
user_choose_city=gets.chomp.downcase
if user_choose_city=="m"
	sorted1 =sorted.select {|hm| hm.city=="Madrid"}
	sorted1.each do |home|
		puts"#{home.name} in #{home.city} \nPrice: $#{home.price} a night"
	end
elsif user_choose_city=="b"
	sorted1 =sorted.select {|hm| hm.city=="Barcelona"}
	sorted1.each do |home|
		puts"#{home.name} in #{home.city} \nPrice: $#{home.price} a night"
	end
elsif user_choose_city=="g"
	sorted1 =sorted.select {|hm| hm.city=="Gran Canaria"}
	sorted1.each do |home|
		puts"#{home.name} in #{home.city} \nPrice: $#{home.price} a night"
	end
else puts "choose an option from the list"
end
#iteration 4
average_choose=sorted1.reduce(0.0){|x,y| x+y.price}/sorted1.length
puts"Your choose's average is #{average_choose}" 
#iteration 5
puts "Enter the price you want for your home"
price_user=gets.chomp.to_i
sorted2=sorted1.find{|hm| hm.price==price_user}
puts "Your ideal home is:\n#{sorted2.name} in #{sorted2.city} \nPrice: $#{sorted2.price} a night "


		