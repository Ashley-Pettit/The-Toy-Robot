#!/usr/local/bin/ruby

# Welcome to Ashley's Toy Robot! V2.1! 
# Used a hash for the vector with % 4 to allows the robot to rotate through 4 vectors.
# Attempting user focused code with things like .upcase and a seperated report function. 
# You can change the size of the table and the robot/table will function just fine. 
# give_command runs in an infinte loop until 'boom' is entered 

# Testing is with Rspec  ############

require_relative 'Table'
require_relative 'VectorsAndMovements'
require_relative 'Feedback'

class Robot

	def initialize
		@robot_placed = false
		@first_command = true
		puts "Good Morning Sir! I am the Toy Robot! \r\n I'm awaiting your command! 
		These are the commands I understand. PLACE / MOVE / LEFT / RIGHT / REPORT. An example is REPORT"
		give_command
		#while @give_command
		#end
	end

	def give_command
		puts "How about another command? Remember I understand PLACE / MOVE / LEFT / RIGHT / REPORT." unless @first_command == true
		@first_command = false
		@user_command = gets.chomp.upcase #My colleagues all wrote in lowercase so i did .upcase to help users. 
			case @user_command
				when "REPORT" then report 
				when "PLACE" then 
					@Feedback.feedback("place_understood")
					#while place
					#end
					place
				when !@robot_placed then    #The subsequent cases are thus where robot_placed = true. 
					@Feedback.feedback("not_on_table")
				when "MOVE" then move (@robot_direction)
				when "LEFT" then VectorsAndMovements.rotate ("left") #load rotate and pass "left"
				when "RIGHT" then rotate ("right")
				when "BOOM"  then boom # Terminate game
				else
					feedback("command_not_understood")
			end
			#@give_command = true
	end

	def place
		puts "I understand [0-4], [0-4], [NORTH, EAST, SOUTH or WEST]. An example is 0 0 WEST"
		command_place = gets.chomp.upcase
		x_position, y_position, @robot_direction = command_place.split(" ") 
# 		@user_command, extra = gets.chomp.upcase.split(" ") 
#		if !extra.nil
#		x_position, y_position, @robot_direction = extra.split(",")
		x_position = Integer x_position rescue nil #Researched .to_i but not used. s.to_i => if string => string to int = int value 0 => x value = 0 => incorrect placement.
		y_position = Integer y_position rescue nil #Thus rescue nil is used so Integer can be used. = Integer is different to .to_i as a string entry throws an error rather than 0. This error must be rescued 
		if is_valid_vector(x_postion, y_position, @robot_direction)
			if is_placement_in_bounds(x_position, y_position)
				feedback("placed")
				@robot_placed = true
				place = true
			else 
				feedback("place_is_off_table")
				place = false
			end		
		else	
				feedback("place_format_invalid")
				place = false
		end
	end

	def report
		@Feedback.feedback("command_understood")
		if @robot_placed then 
			@Feedback.feedback("report")
		else
			@Feedback.Feedback.feedback("report_without_placed")
		end
	end

	def boom
		puts "ERROR ERROR THIS SHOULD NOT HAVE HAPPENEND!!! BOOOOOOMMM!!!...\r\nYour robot exploded... The end."
		#@give_command = false
	end
end

Robot.new  #Start robot - Loads initialize