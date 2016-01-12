class Robot

	def initialize 
		@robot_placed = false
		@first_command = true
		@continue_place = false
		@continue_give_command = true 
		feedback = Feedback.new
		@feedback = feedback
		vectors_and_movements = VectorsAndMovements.new
		@vectors_and_movements = vectors_and_movements
		table = Table.new        #The width and height of the table can be changed under the table class
		@table = table
		puts "Good Morning Sir! I am the Toy Robot! \n 
		I'm awaiting your command! These are the commands I understand. PLACE / MOVE / LEFT / RIGHT / REPORT. An example is REPORT"
		give_command
	end

	def give_command
		while @continue_give_command && !@continue_place #ReRun give_command unless place is running
			puts "How about another command? Remember I understand PLACE / MOVE / LEFT / RIGHT / REPORT." unless @first_command == true
			@user_command = gets.chomp.upcase #My colleagues all wrote in lowercase so i did .upcase to help users. 
			@first_command = false
			case @user_command
				when "REPORT" then report 
				when "PLACE" then 
					feedback.@feedback("place_understood")
					place
				when !@robot_placed then    #The subsequent cases are thus where robot_placed = true. 
					feedback.@feedback("not_on_table")
				when "MOVE" then vectorsAndMovements.move
				when "LEFT" then vectorsAndMovements.rotate ("left") #load rotate and pass "left"
				when "RIGHT" then vectorsAndMovements.rotate ("right")
				when "BOOM"  then boom # Terminate game
				else
				feedback.@feedback("command_not_understood")
			end
		end
	end
	
	def place
		@continue_place = true
		while @continue_place
			puts "I understand [0-4], [0-4], [NORTH, EAST, SOUTH or WEST]. An example is 0 0 WEST"
			command_place = gets.chomp.upcase
			x_position, y_position, @@robot_direction = command_place.split(" ") 
	# 		@user_command, extra = gets.chomp.upcase.split(" ") 
	#		if !extra.nil
	#		x_position, y_position, @robot_direction = extra.split(",")
			x_position = Integer x_position rescue nil #Researched .to_i but not used. s.to_i => if string => string to int = int value 0 => x value = 0 => incorrect placement.
			y_position = Integer y_position rescue nil #Thus rescue nil is used so Integer can be used. = Integer is different to .to_i as a string entry throws an error rather than 0. This error must be rescued 
			if @vectorsAndMovements.is_valid_vector?(x_postion, y_position, @@robot_direction)
				if @table.is_placement_in_bounds?(x_position, y_position)
					@feedback.feedback("placed")
					@robot_placed = true
					@continue_place = false
				else 
					@feedback.feedback("place_is_off_table")
				end		
			else	
					@feedback.feedback("place_format_invalid")
			end
		end
	end

	def report
		feedback.@feedback("command_understood")
		if @robot_placed 
			feedback.@feedback("report")
		else
			feedback.@feedback("report_without_placed")
		end
	end

	def boom
		puts "ERROR ERROR THIS SHOULD NOT HAVE HAPPENEND!!! BOOOOOOMMM!!!...s\nYour robot exploded... The end."
		@continue_give_command = false
		@continue_place = false
	end

    def rotate(direction)
    	@vectors = {"NORTH" => 0, "EAST" => 1, "SOUTH" => 2, "WEST" => 3} 
		@left_or_right = {"left" => -1, "right" => 1}
    	@feedback.feedback("command_understood")
        @robot_direction = @vectors.key((@vectors[@@robot_direction] + @left_or_right[direction]) % 4) # Modulo 4 keeps in the range 0-3
        feedback.@feedback("rotated")
    end
    
	def move(vector)
		feedback.@feedback("command_understood")
		if table.is_move_in_bounds?(vector)
			case vector
				when "NORTH" then @y_position += 1
				when "EAST" then @x_position += 1
				when "SOUTH" then @y_position -= 1
				when "WEST" then @x_position -= 1
			end
			feedback.@feedback("moving")
		else 
			feedback.@feedback("move_not_in_bounds")
		end
	end

	def is_valid_vector(x_position, y_position, vector)
		x_position = 0 || y_position = 0 || @vectors[vector].nil?
	end

    # THIS IS WHAT attr_accessor sort of DOES
	# def robot_direction
	# 	@robot_direction
	# end	

	# def robot_direction=(robot_direction)
	# 	@robot_direction = robot_direction
	# end

end