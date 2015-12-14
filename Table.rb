class Table

	def table_size
		table_width = 4  #Set as 4 because 0 is counted as 1. The table is 5X5 with these settings
		table_height = 4
	end


	def robot_on_table
		#PLACEMENT
		if (0..table_width).include?(@robot_xposition) && (0..table_height).include?(@robot_yposition)
			within_bounds = true
		else
			within_bounds = false

		#MOVEMENT
		
		
move 
	case vector
		when vector = 1 then
		@robot_yposition += 1 
		if (0..table_height).include?(@robot_yposition)
			execute move
			feedback[12]
		else
			robot_yposition -= 1
			feedback[13]
		when 
			



		&& (0..xWidth).include?(@X_yosition) #This prevents a fall
			@y_yosition += 1
			feedback[12]
		elsif @robot_direction == 2 && (0..3).include?(@x_position)
			@x_position += 1
			feedback[12]
		elsif @robot_direction == 3 && (1..4).include?(@y_yosition)
			@y_yosition -= 1
			feedback[12]	
		elsif @robot_direction == 4 (1..4).include?(@x_position)
			@x_position -= 1
			feedback[12]

		end