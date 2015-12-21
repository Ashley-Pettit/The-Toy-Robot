class VectorsAndMovements

	def vectors
		vector = {"NORTH" = 0, "EAST" = 1, "SOUTH" = 2, "WEST" = 3}      #would an array be better. This in progress
	end

	def directions
		robot_directions = ["NORTH", "EAST", "SOUTH", "WEST"] 
	end

	def left
		if robot_direction == "WEST" # this line is to go from 3 >> 0. Is there a better way??
			robot_direction = "NORTH"
		else 
			robot_direction -= 1  #How do I do the opposite of next?
		end
		feedback[11]
		give_command
	end

	def right
		if robot_direction == "NORTH"
			robot_direction = "WEST" 
		else
			robot_direction.next #or +=
		end
		feedback[11]	
		give_command
	end

	def move
		if within_bounds
			case robot_direction
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