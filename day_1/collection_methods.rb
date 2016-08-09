class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49)
]

puts homes[0].name
puts homes[1].name
puts homes[2].name
puts homes[3].name
puts homes[4].name

homes.each do |hm|
  puts hm.name
end
puts " "

homes.each do |home|
	puts"#{home.name} in #{home.city} \nPrice: $#{home.price} a night"
end

puts " "
#exercise map and exercise reduce

homes_prices=homes.map do |home|
	home.price
end
puts homes_prices.reduce{|x,y| x+y}/homes_prices.length
 
 #each_with_index
homes.each_with_index do |hm, index|
  puts "Home Number #{index + 1}: #{hm.name}"
end

puts "select"

# Homes in San Juan
san_juan_homes = homes.select do |hm|
  # Keep hm only if its city is "San Juan"
  hm.city == "San Juan"
end

sorted = homes.sort do |home1, home2|
  # Compare the two homes by their capacity
  home1.capacity <=> home2.capacity
end

puts sorted[1].capacity

