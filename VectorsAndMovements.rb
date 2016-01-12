class VectorsAndMovements

	def initialize
		@vectors = {"NORTH" => 0, "EAST" => 1, "SOUTH" => 2, "WEST" => 3} #This hash allows robot_direction to change 
		@left_or_right = {"left" => -1, "right" => 1}
	end

    def rotate(direction)
    	@feedback.feedback("command_understood")
        @robot_direction = @vectors.key((@vectors[@@robot_direction] + @left_or_right[direction]) % 4) # Modulo 4 keeps in the range 0-3
        feedback.@feedback("rotated")
    end
    
	def move(vector)
		feedback.@feedback("command_understood")
		if table.is_move_in_bounds?(vector)
			case vector
				when "NORTH" then @y_position += 1
				when "EAST" then @x_position += 1
				when "SOUTH" then @y_position -= 1
				when "WEST" then @x_position -= 1
			end
			feedback.@feedback("moving")
		else 
			feedback.@feedback("move_not_in_bounds")
		end
	end

	def is_valid_vector(x_position, y_position, vector)
		x_position = 0 || y_position = 0 || @vectors[vector].nil?
	end

    # THIS IS WHAT attr_accessor sort of DOES
	# def robot_direction
	# 	@robot_direction
	# end	

	# def robot_direction=(robot_direction)
	# 	@robot_direction = robot_direction
	# end
	
end