class Table
# Question - When is initialize run? Is it run during the creation of a class?
	def initialize
		@table_width = 5
		@table_height = 5
	end

	def is_placement_in_bounds?(x_position, y_position)
		(0..(@table_width - 1)).include?(x_position) && (0..(@table_height - 1)).include?(y_position)
	# this is pretty neat that we don't need return here.
	# I added (-1) to account for the table being actually 0-4 not 1-5
	# All working :)
	end

	def is_move_in_bounds?(vector, x_position, y_position)
		#Issue one - (,) seems to not be working here. 
		#Problem caused by case statement not understanding &&. Different to if
		#Forums say (,) may trigger [or] when need [and]
		#When running program result is always [false]? means robot does not move
		#One person suggested () around the two and to use &&
		#I think the statement itself is somehow incorrect?
		#It is required to minus one off the height/width as above
		#Recommendation online to use IF STATEMENT. Changed to IF. 
		if vector == "NORTH" && (0..(@table_height - 1)).include?(y_position + 1)
			return true
		elsif vector == "EAST" && (0..(@table_width - 1)).include?(x_position + 1)
			return true
		elsif vector == "SOUTH" && (0..(@table_height - 1)).include?(y_position - 1)
			return true
		elsif vector == "WEST" && (0..(@table_width - 1)).include?(x_position - 1)
			return true
		else
			return false
		end
	end
end