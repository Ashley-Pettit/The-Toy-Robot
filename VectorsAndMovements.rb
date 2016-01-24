class VectorsAndMovements

# how does this class know @ robotdirection?

    def rotate(direction)
    	@vectors = {"NORTH" => 0, "EAST" => 1, "SOUTH" => 2, "WEST" => 3} 
		@left_or_right = {"left" => -1, "right" => 1}
		@robot_direction = @vectors.key((@vectors[@robot_direction] + @left_or_right[direction]) % 4)
		puts "Understood Sir. I've rotated to the #{direction}!" 
		# 0 - 1 = -1
		# -1 % 4 = 3 => West
    end
    
	def move(vector)
		if @table.is_move_in_bounds?(vector)
			#### Cannot find table. How do I let it access tables functions?
			case vector
				when "NORTH" then @y_position += 1
				when "EAST" then @x_position += 1
				when "SOUTH" then @y_position -= 1
				when "WEST" then @x_position -= 1
			end
		puts "Okay I\'m moving #{@robot_direction} one space!" 
		puts "I\'m now at #{@x_position}, #{@y_position}) and I\'m facing #{@robot_direction}."
		else 
		puts "WAIT!!...NOOOOO!!! I understand you yet...I\'m not doing that." 
		puts "You\'ll drive me off the table! Let's try again..."
		end
	end

	def is_valid_vector?(x_position, y_position, vector) 
		if 	x_position.nil? || y_position.nil? || @vectors[vector].nil?
			return false
			puts "vector invalid - temp"
			# how else could this be written? Could this be just "false" OR is_valid_vector? = false OR return ... 
		else
			return true
			puts "vector valid - temp"
		end
	end
	
end