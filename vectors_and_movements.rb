module VectorsAndMovements
	
	VECTORS = {"NORTH" => 0, "EAST" => 1, "SOUTH" => 2, "WEST" => 3}
	#use .rotate
	LEFT_OR_RIGHT = {"left" => -1, "right" => 1}

    def rotate(direction)
			@robot_direction = VECTORS.key((VECTORS[@robot_direction] + LEFT_OR_RIGHT[direction]) % 4)
			puts "Understood Sir. I\'ve rotated to the #{direction}!"
			puts "I\'m now facing #{@robot_direction}."
			# 0(North) - 1(Left) => -1(Unknown)
			# -1(Unknown) % 4 => 3(West). Thus the robot rotates through 0..3
    end

	def moves
		if @table.is_move_in_bounds?(@robot_direction, @x_position, @y_position)
			case @robot_direction
				when "NORTH" then @y_position += 1
				when "EAST" then @x_position += 1
				when "SOUTH" then @y_position -= 1
				when "WEST" then @x_position -= 1
			end
			puts "Okay I\'m moving #{@robot_direction} one space!"
			puts "I\'m now at (#{@x_position}, #{@y_position}) and I\'m facing #{@robot_direction}."
		else
			puts "WAIT!!...NOOOOO!!! I understand you yet...I\'m not doing that."
			puts "You\'ll drive me off the table! Let's try again..."
		end
	end

	def valid_vector?(x_position, y_position, vector)
		(x_position.nil? && y_position.nil? && ["NORTH","EAST","SOUTH","WEST"]).include?(vector)
	end

end
