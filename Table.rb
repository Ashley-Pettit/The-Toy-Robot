class Table

	def initialize
		@table_width = 5
		@table_height = 5
	end

	def table_range
		"[#{0} - #{@tablewidth - 1}],[#{0} - #{@tableheight - 1}]"
	end

	def is_placement_in_bounds?(x_position, y_position, vector)
		((0..(@table_width - 1)).include?(x_position) && (0..(@table_height - 1)).include?(y_position) && (["NORTH","EAST","SOUTH","WEST"]).include?(vector))
	end

	def is_move_in_bounds?(vector, x_position, y_position)
		if vector == "NORTH" && (0..(@table_height -  1)).include?(y_position + 1)
			true
		elsif vector == "EAST" && (0..(@table_width - 1)).include?(x_position + 1)
			true
		elsif vector == "SOUTH" && (0..(@table_height - 1)).include?(y_position - 1)
			true
		elsif vector == "WEST" && (0..(@table_width - 1)).include?(x_position - 1)
			true
		else
			false
		end
	end


end