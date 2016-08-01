require_relative 'compass'

class Robot
	DIRECTIONS = {"LEFT" => -1, "RIGHT" => 1}

	def initialize(table)
		@table = table
		@compass = Compass.new
	end

	def vectors
		@compass.vectors
	end

	def location(x_position, y_position, robot_direction)
		@x_position = x_position
		@y_position = y_position
		@robot_direction = robot_direction
	end

	def robot_placed?
		!!@x_position
	end

	def rotate(direction)
		# Modulo is used to allow the robot to rotate through a given set of vector values. These values are seperated into the compass class to isolate responsibilities. Changing the vectors (E.g. Adding 'North-East') would not affect the robot and the class could be used for say adding a monster!
		new_vector = (vectors[@robot_direction] + DIRECTIONS[direction]) % vectors.length
		@robot_direction = vectors.key(new_vector)
		puts "Understood. I\'ve rotated to the #{direction}! I\'m now facing #{@robot_direction}"
	end

	def move
		if valid_move?
			puts "Okay I\'m moving forward one space!"
			case @robot_direction
			when "NORTH" then @y_position += 1
			when "EAST" then @x_position += 1
			when "SOUTH" then @y_position -= 1
			when "WEST" then @x_position -= 1
			end
		else
			puts "Nooo! You'd drive me off the table! Command ignored!"
		end
	end

	def report
		puts "My present location is (#{@x_position}, #{@y_position}) facing #{@robot_direction}."
	end

	def valid_move?
		@table.is_move_in_bounds?(@robot_direction, @x_position, @y_position)
	end

end
