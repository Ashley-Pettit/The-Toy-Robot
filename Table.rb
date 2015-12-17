class Table

	def table_size
		table_width = 4  #Set as 4 because 0 is counted as 1. The table is 5X5 with these settings
		table_height = 4
	end


	def robot_on_table
		#PLACEMENT
		if (0..@table_width).include?(@@robot_xposition) && (0..@table_height).include?(@@y_position)
			within_bounds = true
		else
			within_bounds = false
		end

		#MOVEMENT CAUSE FALL? 
		# The logic here used is future state programming for code performance >> It may be unusual however, i've read it leads to better code performance. 

		case vector
		
		when @@vector = 0 then @@y_position += 1 
		if (0..table_height).include?(@@y_position)
			execute move
			feedback[12]
		else
			@@y_position -= 1
			feedback[13]
		end

		when @@vector = 1 then @@x_position += 1 
		if (0..table_width).include?(@@x_position)
			execute move
			feedback[12]
		else
			x_position -= 1
			feedback[13]
		end
		
		when vector = 2 then @@y_position -= 1 
		if (0..table_height).include?(@@y_position)
			execute move
			feedback[12]
		else
			@@y_position += 1
			feedback[13]
		end
		
		when vector = 3 then @@x_position -= 1 
		if (0..table_width).include?(@@x_position)
			execute move
			feedback[12]
		else
			@@x_position += 1
			feedback[13]
		end

end