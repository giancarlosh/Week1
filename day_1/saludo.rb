a=["miami","madrid","barcelona"]
b=a.reduce do |a,b| 
	(a+b)
	end
puts b.length/a.length