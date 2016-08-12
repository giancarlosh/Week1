# @@user="giancarlo"
# @@pass_user="Gian123"

class Autentificacion
	
	def self.login_ usert, pass_usert
		usert=="giancarlo" && pass_usert=="Gian123"
	end
	
end

class Master
	def initialize usert, pass_usert
		@usert=usert
		@pass_usert=pass_usert
	end
	def autentificacion 
		res=Autentificacion.login_ @usert, @pass_usert
		if res==true
			puts "Escribe un texto"
			text=gets.chomp
			eleccion text
		else
			puts "Codigo incorrecto"
		end

	end

	def eleccion text
		puts "Que quieres hacer"
		puts "CW: contar palabras"
		puts "CL: contar letras"
		puts "RT: revertir texto"
		puts "CU: convertir a mayusculas" 
		puts "CL: convertir a minusculas"
		rpta= gets.chomp.upcase
		case rpta
			when "CW"
				Edit.count_words text
			when "CL"
				Edit.count_letters text
			when "RT"
				Edit.reverse_text text
			when "CU"
				Edit.convert_upper text
			when "CL"
				Edit.convert_lower text
			else
				puts "alternativa incorrecta"
				eleccion text
		end
	end
end

class Edit
	
	def self.count_words text
		puts text.split(" ").length 
	end
	def self.count_letters text
		puts text.split(" ").join.size 

	end 
	def self.reverse_text text
		puts text.reverse
	end
	def self.convert_upper text
		puts text.upcase
	end
	def self.convert_lower text
		puts text.downcase
	end

end

puts"usuario:"
user_1=gets.chomp
puts "password"
pass_1=gets.chomp

intento=Master.new user_1, pass_1
intento.autentificacion


