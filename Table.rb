class Table
	attr_writer :within_bounds
	attr_reader :robot_direction
	attr_reader :feedback

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

	def move_in_bounds			# Collect to get value without changing it. 
		case @robot_direction
			when "NORTH" && (0..table_height).include?(@@y_position.collect -= 1) then
				return valid        ########
			when "EAST" && (0..table_width).include?(@@x_position.collect += 1) then
				return valid   #######
			when "SOUTH" && (0..table_height).include?(@@y_position.collect -= 1) then
				return valid  ########
			when "WEST" && (0..table_width).include?(@@x_position.collect -= 1) then
				return valid  ########
			else
				return !valid ########
		end
	end

end