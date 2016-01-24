module VectorsAndMovements

	#You previously had this defined in rotate and were trying to access it in
	#is_valid_vector?. Because it was definited in rotate it wasn't accessible to the class
	#until you called rotate. I have moved it up here to make it a constant
	VECTORS = {"NORTH" => 0, "EAST" => 1, "SOUTH" => 2, "WEST" => 3}
	LEFT_OR_RIGHT = {"left" => -1, "right" => 1}

# how does this class know @ robotdirection?
	#It doesn't. You need to either pass it in to the function, or have this as a module

		#Use proper indentation
    def rotate(direction)
			@robot_direction = VECTORS.key((VECTORS[@robot_direction] + LEFT_OR_RIGHT[direction]) % 4)
			puts "Understood Sir. I've rotated to the #{direction}!"
			# 0 - 1 = -1
			# -1 % 4 = 3 => West
    end

	def move
		if @table.is_move_in_bounds?(@robot_direction, @x_position, @y_position)
			#### Cannot find table. How do I let it access tables functions?
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

	def is_valid_vector?(x_position, y_position, vector)
		if 	x_position.nil? || y_position.nil? || VECTORS[vector].nil?
			return false
			puts "vector invalid - temp"
			# how else could this be written? Could this be just "false" OR is_valid_vector? = false OR return ...

			#Putting something after a return statement as you have done here will ensure that it never gets run
			#The moment a function hits return it will halt execution and return to the calling block

			#Beyond that, you have used the return statements correctly so just change the order of execution
		else
			return true
			puts "vector valid - temp"
		end
	end

end
