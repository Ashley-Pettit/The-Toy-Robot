class Table

	#You previously had this method called #table_size yet you weren't calling it
	#I have swapped it over to initialize because this is the sort of thing
	#that you would want declated at runtime
	def initialize
		@table_width = 5
		@table_height = 5
	end

	def is_placement_in_bounds?(x_position, y_position)
		#You previously had it written as (0..(@table_width))
		#You don't need brackets around @table_width

		(0..@table_width).include?(x_position) && (0..@table_height).include?(y_position)
	end

	#You tried to access @x_position, @y_position but this class doesn't have access to the robot.
	#So you are better off passing them in
	def is_move_in_bounds?(vector, x_position, y_position)

		#The reason for this one not working took me a bit to figure out.
		#Turns out if you want to do multiple conditionals for a case statement
		#you seperate them via comma instead of &&
		case vector
			when "NORTH", (0..@table_height - 1).include?(y_position + 1)
				return true
				# will this return true as a value for the function?
					#No it will call is_move_in_bounds? again as it isn't a variable name

				# Will the previous function continue? Is a lambda required?
					#Yes, you need to explicitly use return here
					#A lamba would be overkill here

			when "EAST", (0..@table_width - 1 ).include?(x_position + 1)
				return true
			when "SOUTH", (0..@table_height - 1).include?(y_position - 1)
				return true
			when "WEST", (0..@table_width - 1).include?(x_position - 1)
				return true
			else
				puts "out of bounds - temp"

				#You don't need the return here as the function will return anyway
				#As you are at the end of the function
				false
		end
	end

end
