#!/usr/local/bin/ruby

# Welcome to Ash's Toy Robot
# Few Comments
# 
# 1 - A hash is used for the vector using % 4. This allows the robot to rotate through 4 vectors without hard coding.
# 2 - Testing is under Testing.rb and is using rspec
# 3 - The program is built with two classes and one module. Two classes specify the two main items that interact. There was previously more classes yet
# it lead to greater than than less complexity. For example feedback was previously a class yet I felt it added rather than removed complexity.
# 4 - give_command continues to run infinately unless the program is running place OR the user enters BOOM to end the program
# 5 - Left and right are joined as one command called rotate which passes either "left" or "right"
# 6 - There is an initial greeting which is one run once due to an 'unless' statement
# 7 - James McClaren with his great help assisted me in building this project. 
# 8 - Rescue Nil was used to help with integer conversion. As it is confined in it's use it is highly unlikely to hide an error.
# 9 - .sub is used to remove "PLACE" from the place_instantly (Pro) function
# 10 - .Starts_with was made to check if the user was attempting the place instantly command. If place instantly fails the user returns to the place command
# Extra - This project goes beyond the initial spec to attempt to make the program user accessible
# 	-   a) .upcase is used incase the user enters a lowercase command
# 	-   b) feedback is far more detailed than the spec specifies
# 	-   c) there is a command for [PLACE] and [PLACE x,y,vector]. This allows beginner users to place the robot
# 	-   d) The size of the table can be changed
# 	-	e) The exit command 'BOOM'
# 	-	f) The program attempts to give specific feedback e.g. movement would be off table rather than 'invalid command'
# Despite making the program longer; this was designed to make the program more user friendly and now can be used by a non-technical user. It's also more fun!

require_relative 'Table'
require_relative 'VectorsAndMovements'

class Robot
	include VectorsAndMovements

	def initialize
		@robot_placed = false
		@first_command = true
		@continue_give_command = true
		@continue_place = false
 		@table = Table.new
 		puts "Good Morning Sir! I am the Toy Robot!"
 		puts "I'm awaiting your command! These are the commands I understand."
 		puts "PLACE / MOVE / LEFT / RIGHT / REPORT. An example is REPORT." 
 		puts "Advanced users may want to use PLACE X,Y,VECTOR."
		give_command
	end

	def give_command
		while @continue_give_command 
			puts "How about another command?" unless @first_command
			@first_command = false
			@user_command = gets.chomp.upcase #To help users. Users always wrote in lowercase.
			if (@user_command.start_with?("PLACE") && @user_command != "PLACE")
				#This is to allow [PLACE] OR [PLACE x,y,vector]. I feel this made the robot more accessible to the standard user.
				place_instantly
			elsif @user_command == "PLACE"
				puts "Hey I understand you! Now... Where would you like to put me down?"
				place
			elsif @robot_placed
				case @user_command 
					when "REPORT" then report
					when "MOVE" then move 
					when "LEFT" then rotate("left") 
					when "RIGHT" then rotate("right")
					when "BOOM"  then boom 
				end	
			elsif valid_command?
				puts "This is a valid command but I\'m not on the table yet!"
				puts "Please use [PLACE] to put me on the table before entering [#{@user_command}]"
			else 
				puts "Attempting [#{@user_command}] command... Hrmmmm...."
				puts "Sorry sir but I don't understand you :("
				puts "I understand PLACE / MOVE / LEFT / RIGHT / REPORT."
			end
		end
	end

	def valid_command?
		["PLACE","REPORT","MOVE","LEFT","RIGHT","BOOM"].include?(@user_command)
	end

	def place
		@continue_place = true
		@continue_give_command = false
		while @continue_place
			puts "I understand [0-4], [0-4], [NORTH, EAST, SOUTH or WEST]. An example is 0 0 WEST" #This isn't correct. Table changes
			@user_command = gets.chomp.upcase
	 		@x_position, @y_position, @robot_direction = @user_command.split(" ")
	 		execute_placement
		end
	end

	def place_instantly 
		@user_command.sub!("PLACE", "") 
	 	@x_position, @y_position, @robot_direction = @user_command.split(",")
		execute_placement
	end

	def execute_placement
		@x_position = Integer @x_position rescue nil #rescue nil is used as a string entry throws an error. This error must be rescued
		@y_position = Integer @y_position rescue nil 
		if @table.is_placement_in_bounds?(@x_position, @y_position, @robot_direction)
			puts "Okay Sir, I have been placed at #{@x_position} #{@y_position} facing #{@robot_direction}."
			@robot_placed = true
			@continue_place = false
			@continue_give_command = true
		else
			puts "You're entry makes no sense - You told me [#{@user_command}]. Let's try again."
			puts "Please PLACE me within the bounds of the table following the given example"
			place
		end
	end

	def report
		puts "My present location is #{@x_position}, #{@y_position}) facing #{@robot_direction}. Let's get moving!"
	end

	def boom
		puts "ERROR ERROR THIS SHOULD NOT HAVE HAPPENEND!!! BOOOOOOMMM!!!..."
		puts "Your robot exploded... The end."
		@continue_give_command = false
		@continue_place = false
	end

  	def starts_with?(characters)
    	self.match(/^#{characters}/) ? true : false
  	end

end

Robot.new 