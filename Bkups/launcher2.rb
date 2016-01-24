#!/usr/local/bin/ruby

# Welcome to Ashley's Toy Robot! V2.1! 
# I've tried my best to write this in an OO style using minimal code repetition. 
# I used a hash for the vector to allow it to have a string key and integer value. This allows easy changes to vectors
# Trying to show I put the user first in my code with things such as .upcase to help a user if they write in lower case 
# You can change the size of the table and the robot/table will function just fine.

# Testing is with Rspec  ############

require_relative 'Table'
require_relative 'Vectors_and_movements'
require_relative 'feedback'

class Robot

	def initialize
		@robot_placed = false
		@first_command = true
		puts "Good Morning Sir! I am the Toy Robot!"
		puts "I'm awaiting your command! These are the commands I understand. PLACE X,Y,F / MOVE / LEFT / RIGHT / REPORT. An example is REPORT"
		while get_command
		end
	end

	def get_command
		puts "How about another command? Remember I understand PLACE / MOVE / LEFT / RIGHT / REPORT." unless @first_command == true
		@first_command = false
		@user_command, extra = gets.chomp.upcase.split(" ") 
		x_position, y_position, @robot_direction = extra.split(",")


		x_position = Integer x_position rescue nil #How else could I ensure a non-interger doesn't fail? 
		y_position = Integer y_position rescue nil #################
		@robot_direction.upcase unless @robot_direction.is_a? Integer # DANGEROUS

#		puts @user_command + " : " + x_position + " : " + y_position + " : " + @robot_direction + " : " + junk

			case user_command
				when "REPORT" then report 
				when "PLACE" then 
#					puts feedback [2]
#					while place
#					end            v		if is_valid_vector(x_postion, y_position, @robot_direction)
					place (x_position, y_position, @robot_direction)
				when !@robot_placed then 
					puts feedback[3] 
				when "MOVE" then move (@robot_direction) #Will this work?? I don't know @robot_direction in this function
				when "LEFT" then rotate("left") #load rotate and pass "left"
				when "RIGHT" then rotate("right")
				when "BOOM"  then boom # Terminate game
				else   #invalid input
					puts feedback[4]
			end
			give_command = true
	end

	def place(x_position, y_position, @robot_direction)
#		puts "I understand [0-4], [0-4], [NORTH, EAST, SOUTH or WEST]. An example is 0 0 WEST"
#		command_place = gets.chomp
#		x_position, y_position, @robot_direction = command_place.split(" ") 
#		x_position = Integer x_position rescue nil #How else could I ensure a non-interger doesn't fail? 
#		y_position = Integer y_position rescue nil #################
#		@robot_direction.upcase unless @robot_direction.Is_a? Integer # DANGEROUS
		if is_valid_vector(x_position, y_position, @robot_direction)
			if is_placement_in_bounds(x_position, y_position)
				feedback[9]
				@robot_placed = true
				place = true
			else 	#The placement was outside table bounds
				feedback[7]
				feedback[8]
				place = false
			end		
		else	#The command_place was invalid
				feedback[5]
				feedback[6]		
				place = false
		end
	end

	def report
		if @robot_placed then 
			puts feedback[10] # exectue report
		else
			puts feedback[1] #robot has not been placed so can't report		
		end
	end

	def boom
		puts "ERROR ERROR THIS SHOULD NOT HAVE HAPPENEND!!! BOOOOOOMMM!!!..."
		puts "Your robot died."
		give_command = false
	end
end

Robot.new  #Start game
