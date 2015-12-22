class VectorsAndMovements

	attr_accessor :robot_direction

	#Vectors are a touch tricky. Here I've decided that robot_direction is always a sting yet vector will help robot_direction to change via a hash. 
	#Note line 25-26 is hardcoded. Not ideal :( Easiest solution thou :) Could build something to get around but overcomplicating things. 


	def vectors
		@vector = {"NORTH" => 0, "EAST" => 1, "SOUTH" => 2, "WEST" => 3} 
	end

	def left
		if @robot_direction == "NORTH"
			@robot_direction = "WEST"
		else 
			@vector = {|string, integer| @vector.key = integer +=1} ####################
		end
		feedback[11]
		give_command
	end

	def right
		if @robot_direction == "WEST"
			@robot_direction = "NORTH" 
		else
			@vector = {|string, integer| @vector.key = integer +=1} ####################
		end
		feedback[11]	
		give_command
	end

	def move
		if move_in_bounds return valid
			case @robot_direction
				when "NORTH" then @@y_position +=1
				when "EAST" then @@x_position +=1
				when "SOUTH" then @@y_position -=1
				when "WEST" then @@x_position -=1
			end
			feedback[12]
		else 
			feedback[13]    # User told the command would drive the robot off table. Move not executed.
			give_command
		end
	end

	def valid_vector
 		if ["NORTH", "WEST", "EAST", "SOUTH"].include?(@robot_direction) && (!@@x_position.nil? && !@@y_position.nil?)
 			return valid
 		end
	end
	
end