class VectorsAndMovements

	attr_accessor :@robot_direction

	@vectors = {"NORTH" => 0, "EAST" => 1, "SOUTH" => 2, "WEST" => 3} #This hash allows robot_direction to change 
	@left_or_right = {"left" => -1, "right" => 1}

    def rotate(direction)
    	Feedback.feedback("command_understood")
        @robot_direction = @vectors.key((@vectors[@robot_direction] + @left_or_right[direction]) % 4) # => "NORTH"(0) + "LEFT"(-1) => "WEST"(3)  
        Feedback.feedback("rotated")
    end
    
	def move(vector)
		feedback("command_understood")
		if is_move_in_bounds(vector)
			case vector
				when "NORTH" then @y_position += 1
				when "EAST" then @x_position += 1
				when "SOUTH" then @y_position -= 1
				when "WEST" then @x_position -= 1
			end
			feedback("moving")
		else 
			feedback("move_not_in_bounds")
		end
	end

	def is_valid_vector(x_position, y_position, vector)
		if x_position = 0 || y_position = 0 || @vectors[vector].nil?
 			valid_vector = false
 		else
 			valid_vector = true
 		end
	end
	
end