class VectorsAndMovements

	#Vectors are a touch tricky. Here I've decided that robot_direction is always a sting yet vector will help robot_direction to change via a hash. 
	#Note line 25-26 is hardcoded. Not ideal :( Easiest solution thou :) Could build something to get around but overcomplicating things. 

	def valid_vector_command
 		if ["NORTH", "WEST", "EAST", "SOUTH"].include?(@robot_direction) && (!@x_position.nil? && !@y_position.nil?)
 			return valid
 		end
	end
	
	def vectors
		@vector = {"NORTH" => 0, "EAST" => 1, "SOUTH" => 2, "WEST" => 3} 
	end

	def left
		if robot_direction == "NORTH"
			robot_direction = "WEST"
		else 
			vector  {|string, integer| integer -=1; robot_direction = string} 
		end
		feedback[11]
		give_command
	end

	def right
		if robot_direction == "WEST"
			robot_direction = "NORTH" 
		else
			vector  {|string, integer| integer +=1; robot_direction = string} 
		end
		feedback[11]	
		give_command
	end

	def move
		if within_bounds
			case robot_direction
				when "NORTH" then y_position +=1
				when "EAST" then x_position +=1
				when "SOUTH" then y_position -=1
				when "WEST" then x_position -=1
			end
			puts feedback[12]
		else 
			puts feedback[13]
			give_command
		end
	end

end