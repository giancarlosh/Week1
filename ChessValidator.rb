require 'pry'
module Mouvement_helper
	def bishop_validator(array_origin, array_fin)
		array_fin[0]-array_origin[0]==array_fin[1]-array_origin[1]&&array_fin[0]<9&&array_fin[1]<9
			
	end	

	def rook_validator array_origin, array_fin

		(array_fin[1]<9 &&array_origin[0]==array_fin[0])||(array_fin[0]<9&&array_origin[1]==array_fin[1])
		
	end
end
class Piece
	
	#D3,B3a
	def initialize posini, posifin, char_in, color
		@posini=posini
		@posifin=posifin
		@char_in=char_in
		@color=color
	
	end

	def array_origin
		@x_pos=@char_in[@posini[0].to_sym]
		@y_pos=@posini[1].to_i
		a=[@x_pos, @y_pos]
		
		a
		
	end
	def array_fin
		@x_fin=@char_in[@posifin[0].to_sym]
		@y_fin=@posifin[1].to_i
		b=[@x_fin, @y_fin]
		b
	
	end
end
class Rook < Piece
	include Mouvement_helper
	def validator array_origin, array_fin
		if rook_validator(array_origin,array_fin)===true
			puts "legal"
		else
			puts "ilegal"
		end

	end
end

class Bishop < Piece
	include Mouvement_helper

	def validator array_origin, array_fin
		if bishop_validator(array_origin,array_fin)==true
			puts "legal"
		else
			puts "ilegal"
		end

	end
end

class Queen < Piece
	include Mouvement_helper
	def validator array_origin, array_fin

		if (bishop_validator(array_origin,array_fin)==true ) || (rook_validator(array_origin, array_fin) ==true)

			puts "legal"
		else
			puts "ilegal"
		end
	end
end

class Knight < Piece
	include Mouvement_helper
	def validator ao, af
		if (bishop_validator(ao,af)==false ) && (rook_validator(ao,af) ==false)&&(af[1]-ao[1]<3)&&(af[0]-ao[0]<3)
			puts "legal"
		else
			puts "ilegal"
		end
	end
end
class King < Piece
	def validator array_origin, array_fin
		if((array_fin[1]-array_origin[1]).abs>1||(array_fin[0]-array_origin[0]).abs>1) 
			puts "ilegal"
		else
			puts "legal"
		end
	end
end
class Pawns < Piece
	def validator array_origin, array_fin
		if @color ="B"
			if ((array_fin[1]==array_origin[1])&&0<(array_fin[0]-array_origin[0])<3)
				puts "legal"
				
			else
				puts"ilegal"
				
			end
		end
		if @color="W"
			if ((array_fin[1]==array_origin[1])&&(-3<(array_fin[0]-array_origin[0])<0))
				puts "legal"
			else
				puts "ilegal"
			end
		end


	end

end



char_in= {
		A:1,B:2,C:3,D:4,E:5,F:6,G:7,H:8
	}

# class Validator
# 	def rook_move
# torre
rook_move=Rook.new("C3","C7",char_in,"B")
array_origin=rook_move.array_origin
array_fin=rook_move.array_fin
rook_move.validator(array_origin, array_fin)

#alfil
bishop_move=Bishop.new("E5","C3",char_in,"B")
array_origin=bishop_move.array_origin
array_fin=bishop_move.array_fin
bishop_move.validator(array_origin, array_fin)

# #reina
queen_move=Queen.new("C3","E7",char_in,"B")
array_origin=queen_move.array_origin
array_fin=queen_move.array_fin
queen_move.validator(array_origin, array_fin)
#caballo t
knight_move=Knight.new("A1","C2",char_in,"B")
array_origin=knight_move.array_origin
array_fin=knight_move.array_fin
knight_move.validator(array_origin, array_fin)
#rey
king_move=King.new("A1","B2",char_in,"B")
array_origin=king_move.array_origin
array_fin=king_move.array_fin
king_move.validator(array_origin, array_fin)
#peon
pawn_move=Pawns.new("B3","B1",char_in,"W")
array_origin=pawn_move.array_origin
array_fin=pawn_move.array_fin
pawn_move.validator(array_origin, array_fin)
