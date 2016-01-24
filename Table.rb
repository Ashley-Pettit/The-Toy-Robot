class Table

	def table_size
		@table_width = 5 
		@table_height = 5  
	end

	def is_placement_in_bounds?(x_position, y_position)
		(0..(@table_width)).include?(x_position) && (0..(@table_height)).include?(y_position)
	end

	def is_move_in_bounds?(vector)
		case vector
			when "NORTH" && (0..@table_height - 1).include?(@y_position - 1) then
				is_move_in_bounds? 
				# will this return true as a value for the function? 
				# Will the previous function continue? Is a lambda required?
			when "EAST" && (0..@table_width - 1 ).include?(@x_position + 1) then
				is_move_in_bounds?
			when "SOUTH" && (0..@table_height - 1).include?(@y_position - 1) then
				is_move_in_bounds? 
			when "WEST" && (0..@table_width - 1).include?(@x_position - 1) then
				is_move_in_bounds?
			else
				false
				puts "out of bounds - temp"
		end
	end

end
