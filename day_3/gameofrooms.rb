class Room
	attr_reader :description, :doors
	def initialize description, doorN, doorE, doorS, doorW
		@description=description
		@doors={ n:doorN, e:doorE, s:doorS, w:doorW}
	end
end

class Game
	def initialize rooms, win_room
		#variable que nos indicara en que room estamos 
		@current_room=0
		@win_room=win_room
		@rooms=rooms
	end
	def print_description

		puts "Estas en #{@rooms[@current_room].description}."
		##accedo a cada elemento del hash d la clase Roomm
		@rooms[@current_room].doors.each do |key,value|
			if (value!=-1)	
				puts"hay una puerta en direccion #{key.to_s.upcase}"
			end
		end	
	end
	def change_room num_room
		@current_room=num_room
		
	end
	def make_decition decition
		doors=@rooms[@current_room].doors
		case decition.upcase
			when "N"
				if doors[:n]!=-1
					change_room doors[:n]
				end
			when "E"
				if doors[:e]!=-1
					change_room doors[:e]
				end
			when "S"
				if doors[:s]!=-1
					change_room doors[:s]
				end
			when "W"
				if doors[:w]!=-1
					change_room doors[:w]
				end
			else
				puts"Debes escoger una opcion correcta"
		end
	end
	def  play_game
		puts"Bienvenido a Game of Rooms!"
		exit=false
		win=false

		while !exit && !win
			print_description
			puts "En que direccion quieres ir?\nPara ir al norte pulsa N\nPara ir al sur pulsa S"
			puts "Para ir al este pulsa E\nPara ir al oeste pulsa W\nPara salir pulsa X "
			decition=gets.chomp.upcase
			if decition=="X"
				exit=true
			else
				make_decition decition
				if @current_room==@win_room
					win=true
					puts"HAS GANADO....!!!!!"
				end
			end

		end

	end

end

game_array=[
		Room.new("habitación 0",-1,1,2,-1),
		Room.new("habitación 1",-1,-1,3,0),
		Room.new("habitación 2",0,-1,-1,-1),
		Room.new("habitación 3",1,-1,-1,-1)		
]
game=Game.new game_array, 3
game.play_game
