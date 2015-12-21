#!/usr/local/bin/ruby

# Welcome to Ashley's Toy Robot! V2.1! 
# I've tried my best to write this in an OO style using minimal code repetition. 
# I used a hash for the vector to allow it to have a string key and integer value. This allows easy changes to vectors
# Trying to show I put the user first in my code with things such as .upcase to help a user if they write in lower case 
# You can change the size of the table and the robot will function just fine.

# Testing is with Rspec

require...


class Robot

	def initalize
		puts "Good Morning Sir! I am the Toy Robot!"
		puts "I'm awaiting your command! These are the commands I understand. PLACE / MOVE / LEFT / RIGHT / REPORT. An example is REPORT"
		@robot_placed = false
		feedback = Array.new
		give_command
	end

	def give_command
		puts "How about another command? Remember I understand PLACE / MOVE / LEFT / RIGHT / REPORT." unless first_command = true
		first_command = false
		@user_command = gets.chomp.upcase #My colleagues all wrote in lowercase so i did  .upcase to help users. 
			case user_command
				when "REPORT" && !@robot_placed then 
					puts feedback[1]		
					give_command
				when "PLACE" then 
					puts feedback [2]
					place            
				when !@robot_placed then 
					puts feedback[3] 
					give_command
				when "MOVE" then move 
				when "LEFT" then left 
				when "RIGHT" then right
				when "REPORT" then report
				when "BOOM" then boom
				else
					puts feedback[4]
					give_command			
			end
	end


	def place
		puts "I understand [0-4], [0-4], [NORTH, EAST, SOUTH or WEST]. An example is 0 0 WEST"
		command_place = gets.chomp
		x_position, y_position, robot_direction = command_place.split(" ") 
		x_position = Integer x_position rescue nil 	#How else could I ensure a non-interger doesn't fail? 
		y_position = Integer y_position rescue nil 
		robot_direction.upcase
		if validvector.call return !valid 
			if @@within_bounds
				puts feedback[9]
				@robot_placed = true
				give_command
			else 	#The placement was outside table bounds
				feedback[7]
				feedback[8]
				place
			end		
		else	#The command_place was invalid
				feedback[5]
				feedback[6]		
				place
		end
	end

	def report
		puts feedback[10]
		give_command
	end

	initalize
end
