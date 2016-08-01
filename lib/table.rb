class Table
	def initialize
		@table_width = 5
		@table_height = 5
	end

	def table_range(width_or_height)
		(0..width_or_height - 1)
	end

	def is_placement_in_bounds?(x_position, y_position)
		table_range(@table_width).include?(x_position) && table_range(@table_height).include?(y_position)
	end

	def is_move_in_bounds?(vector, x_position, y_position)
		if vector == "NORTH" && table_range(@table_height).include?(y_position + 1)
			true
		elsif vector == "EAST" && table_range(@table_width).include?(x_position + 1)
			true
		elsif vector == "SOUTH" && table_range(@table_height).include?(y_position - 1)
			true
		elsif vector == "WEST" && table_range(@table_width).include?(x_position - 1)
			true
		else
			false
		end
	end
end
