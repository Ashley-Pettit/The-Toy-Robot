class VectorsAndMovements < Robot

    def rotate(direction)
    	@vectors = {"NORTH" => 0, "EAST" => 1, "SOUTH" => 2, "WEST" => 3} 
		@left_or_right = {"left" => -1, "right" => 1}
    	@feedback.give_feedback("command_understood")
        @robot_direction = @vectors.key((@vectors[@robot_direction] + @left_or_right[direction]) % 4) # Modulo 4 keeps in the range 0-3
        @feedback.give_feedback("rotated")
    end
    
	def move(vector)
		@feedback.give_feedback("command_understood")
		if @table.is_move_in_bounds?(vector)
			case vector
				when "NORTH" then @y_position += 1
				when "EAST" then @x_position += 1
				when "SOUTH" then @y_position -= 1
				when "WEST" then @x_position -= 1
			end
			@feedback.give_feedback("moving")
		else 
			@feedback.give_feedback("move_not_in_bounds")
		end
	end

	def is_valid_vector?(x_position, y_position, vector) # could you use a ! sign here?
		if 	x_position = 0 || y_position = 0 || @vectors[vector].nil?
			return false
		else
			return true
	end
	
end