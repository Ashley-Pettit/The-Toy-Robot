class VectorsAndMovements

	def vector
		vectors = { "NORTH" = 0, "EAST" = 1, "SOUTH" = 2, "WEST" = 3 }     #A simple hash makes vectors easy :)    
	end


	def left
		if vector.key == "WEST"
			vector.key = "NORTH"
		else 
			vector.value -= 1  #How do I do the opposite of next?
		end
		feedback[11]
		give_command
	end

	def right
		if vector == "NORTH"
			vector = "WEST" 
		else
			vector.next #or +=
		end
		feedback[11]	
		give_command
	end

	def move
		if withinbounds
			case vectors
				when 0 then y_position +=1			
				when 1 then x_position +=1
				when 2 then y_position -=1
				when 3 then x_position -=1
			end
			puts feedback[12]
		else 
			puts feedback[13]
			give_command
		end

	end


end