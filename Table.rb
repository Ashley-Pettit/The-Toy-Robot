class Table

	attr_accessor :@x_position
	attr_accessor :@y_position

	def table_size
		@table_width = 4   #Note this leads to a 5x5 table as 0 is counted as the first value. This could be changed using + 1.
		@table_height = 4   
	end


	def is_placement_in_bounds (x_position, y_position)
		if (0..(@table_width)).include?(x_position) && (0..(@table_height)).include?(y_position)
			is_placement_in_bounds = true
		else
			is_placement_in_bounds = false
		end
	end

	def is_move_in_bounds(vector)
		case vector
			when "NORTH" && (0..@table_height).include?(@y_position.collect -= 1) then #collect is used to test the variable rather than to modify
				is_move_in_bounds = true
			when "EAST" && (0..@table_width).include?(@x_position.collect += 1) then
				is_move_in_bounds = true
			when "SOUTH" && (0..@table_height).include?(@y_position.collect -= 1) then
				is_move_in_bounds = true
			when "WEST" && (0..@table_width).include?(@x_position.collect -= 1) then
				is_move_in_bounds = true
			else
				is_move_in_bounds = false
		end
	end

end
