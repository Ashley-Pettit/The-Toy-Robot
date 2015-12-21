class Table
	attr_accessor :within_bounds

	def table_size
		@table_width = 4  #Set as 4 because 0 is counted as 1. The table is 5X5 with these settings
		@table_height = 4
	end


	def placement_in_bounds
		if (0..@table_width).include?(@@robot_xposition) && (0..@table_height).include?(@@y_position)
			within_bounds = true
		else
			within_bounds = false
		end
	end

	def wont_fall			# Collect to get value without changing it. 
		case @robot_direction
			when "NORTH" && (0..table_height).include?(@@y_position.collect -= 1) then
				move.call
				feedback[12]
			when "EAST" && (0..table_width).include?(@@x_position.collect += 1) then
				move.call
				feedback[12]
			when "SOUTH" && (0..table_height).include?(@@y_position.collect -= 1) then
				move.call
				feedback[12]
			when "WEST" && (0..table_width).include?(@@x_position.collect -= 1) then
				move.call
				feedback[12]
			else
				feedback[13]    # User told the command would drive the robot off table. Move not executed.
				give_command
		end
	end

end