#!/usr/local/bin/ruby

# Welcome to Ash's toy robot!! I wrote this when I first starting coding ruby in October 2015. 
# It may not be perfect code!! It does however, have a BOOM command :)

# This is just verison 1. It is fully functional yet has the following known issues.
# 1 - The code is not properly 00
# 2 - There is room for improvements to stop code repetition with better objects and arrays/hashes/cases
# 3 - There is no testing
# 4 - All set as @ variables when this is likely not needed

class Robot

	def initalize
		@robot_placed = false
		puts "Good Morning Sir! I am the Toy Robot!"
		give_command
		puts "I'm awaiting your command! These are the commands I understand. PLACE / MOVE / LEFT / RIGHT / REPORT. An example is REPORT"
	end

	def give_command
		puts "How about another command? PLACE / MOVE / LEFT / RIGHT / REPORT."
		@user_command = gets.chomp.upcase #.upcase to help user if they write command in lower case. My colleagues all wrote in lowercase 
		if user_command = valid
			case user_command
				when "REPORT" then
					puts feedback[1]		
					giveCommand
				unless !@robotPlaced
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
					error_detected 
				end
		elsif user_command != valid
			puts feedback [4]
			giveCommand
		else
			error_detected
		end
	end


	def place
		puts "I understand [0-4], [0-4], [NORTH, EAST, SOUTH or WEST]. An example is 0 0 WEST"
		@command_place = gets.chomp
		x_position, y_position, @robot_direction = @command_place.split(" ") 
		x_position = Integer @x_position rescue nil
		y_position = Integer @y_position rescue nil 
		if @command_place = valid && within_bounds
			puts feedback[9]
			@robot+placed = true
			giveCommand
		elsif @command_place = valid && !within_bounds
			feedback[7]
			feedback[8]					
			place
		else #The command_place was invalid
			feedback[5]
			feedback[6]		
			place
		end			
	end


	def report
		puts feedback[10]
		giveCommand
	end

	initalize
end
