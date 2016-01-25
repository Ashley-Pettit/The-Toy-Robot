#!/usr/local/bin/ruby

# Welcome to Ashley's Toy Robot! V2.1!
# Used a hash for the vector with % 4 to allows the robot to rotate through 4 vectors.
# Attempting user focused code with things like .upcase and a seperated report function.
# You can change the size of the table and the robot/table will function just fine.
# give_command runs in an infinte loop until 'boom' is entered

# Testing is with Rspec  ############

require_relative 'Table'
require_relative 'VectorsAndMovements'

class Robot
	include VectorsAndMovements

	def initialize
		@robot_placed = false
		@first_command = true
<<<<<<< HEAD
		@continue_give_command = true
		@continue_place = false
 		@table = Table.new
=======

		#This doesn't actually appear to be doing anything
		# @continue_place = false

		@continue_give_command = true

		#There is no need to do a double definition like this
		# table = Table.new
 		# @table = table
 		#Do it like this:
 		@table = Table.new

>>>>>>> origin/master
 		puts "Good Morning Sir! I am the Toy Robot!"
 		puts "I'm awaiting your command! These are the commands I understand."
 		puts "PLACE / MOVE / LEFT / RIGHT / REPORT. An example is REPORT"
		give_command
	end

	def give_command

<<<<<<< HEAD
		while @continue_give_command 
			puts "How about another command?\n" unless @first_command
			puts "Remember I understand PLACE / MOVE / LEFT / RIGHT / REPORT." unless @first_command
			@first_command = false
			@user_command = gets.chomp.upcase #To help users. Users always wrote in lowercase.
			
			case @user_command
				when "REPORT" then report
				when "PLACE" then place
					#Issue 2 - @robot_placed == false is not triggering
				when @robot_placed == false then puts "test"
				puts "I'm not on the table yet!"
				puts "Please use [PLACE] to put me on the table."
				when "MOVE" then move 
				when "LEFT" then rotate("left") #load rotate and pass "left"
				when "RIGHT" then rotate("right")
				when "BOOM"  then boom # Terminate game
				
=======
		while @continue_give_command
			#If you are doing <do something> unless @first_command == true
			#You could just as easily do: <do something> unless @first_command

			puts "How about another command?\n" \
			"Remember I understand PLACE / MOVE / LEFT / RIGHT / REPORT." unless @first_command

			@first_command = false
			@user_command = gets.chomp.upcase #To help users. Users always wrote in lowercase.
			case @user_command
				when "REPORT" then report
				when "PLACE" then place
				when @robot_placed == false then #The subsequent cases are thus where robot_placed = true.
				puts "Wait... Your command is okay but I need to be on the table first."
				puts "Please use [PLACE] to put me on the table."


				#You are calling move here without passing in an argument.
				#In vectors_and_movements.rb you have defined
				# #move(vector) yet here you are just calling #move


				when "MOVE" then move
				######LEFT/RIGHT not working. Can't find rotate
				when "LEFT" then rotate("left") #load rotate and pass "left"
				when "RIGHT" then rotate("right")
				when "BOOM"  then boom # Terminate game

>>>>>>> origin/master
				else
					puts "ATTTTEMMMPPTING [#{@user_command}] COMMAND... Hrmmmm.... Wait... Nope..."
					puts "Sorry sir but I don't understand you :("
			end
		end
	end


	def place
		puts "Hey I understand you! Now... Where would you like to put me down?"

		while !placed?
			puts "I understand [0-4], [0-4], [NORTH, EAST, SOUTH or WEST]."
			puts "An example is 0 0 WEST"
			command_place = gets.chomp.upcase
			x_position, y_position, @robot_direction = command_place.split(" ")
<<<<<<< HEAD
	# 		NEED TO FINISH TO MEET SPEC. Should be able to take place 1 0 east in 1 command
	# 		@user_command, extra = gets.chomp.upcase.split(" ")
	#		if !extra.nil
	#		x_position, y_position, @robot_direction = extra.split(",")
			@x_position = Integer x_position rescue nil #Researched .to_i but not used. s.to_i => if string => string to int = int value 0 => x value = 0 => incorrect placement.
			@y_position = Integer y_position rescue nil #Thus rescue nil is used so Integer can be used. = Integer is different to .to_i as a string entry throws an error rather than 0. This error must be rescued
			if is_valid_vector?(@x_position, @y_position, @robot_direction)
				if @table.is_placement_in_bounds?(@x_position, @y_position)
=======
	# 		@user_command, extra = gets.chomp.upcase.split(" ")
	#		if !extra.nil
	#		x_position, y_position, @robot_direction = extra.split(",")
	#		This is just extra as it's needed to meet the extact spec
			x_position = Integer x_position rescue nil #Researched .to_i but not used. s.to_i => if string => string to int = int value 0 => x value = 0 => incorrect placement.
			y_position = Integer y_position rescue nil #Thus rescue nil is used so Integer can be used. = Integer is different to .to_i as a string entry throws an error rather than 0. This error must be rescued
			if is_valid_vector?(x_position, y_position, @robot_direction)
				# Cannot find is_valid_vector?
				if @table.is_placement_in_bounds?(x_position, y_position)
>>>>>>> origin/master
					puts "Okay Sir, I have been placed at #{x_position} #{y_position} facing #{@robot_direction}."
					@robot_placed = true
<<<<<<< HEAD
					@continue_place = false
					@continue_give_command = true
					#Changed this a little in how continue works. I might relook and making it cleaner
=======
					give_command
>>>>>>> origin/master
				else
					puts "Nooooooo your placing me off the table!!! I won't do it! I won\'t!"
					puts "One more time.... Please PLACE me within the bounds of the table"
				end
			else
				puts "Sorry Sir the PLACE command direction format is invalid."
				puts "One more time... Please follow the example format"
			end
		end
	end

	def report
<<<<<<< HEAD
		if @robot_placed
=======
		if placed?
>>>>>>> origin/master
			puts "Gotcha! Okay... My present location is (#{@x_position}, #{@y_position}) facing #{@robot_direction}."
		else
			puts "I need to be board first. Please enter [PLACE] to put me down."
			puts "Many Thanks, The Toy Robot"
		end
	end

	def boom
		puts "ERROR ERROR THIS SHOULD NOT HAVE HAPPENEND!!! BOOOOOOMMM!!!..."
		puts "Your robot exploded... The end."
		@continue_give_command = false
		@continue_place = false
	end

	def placed?
		@robot_placed
	end

end

<<<<<<< HEAD
robot = Robot.new
=======
robot = Robot.new

    # THIS IS WHAT attr_accessor sort of DOES
	# def robot_direction
	# 	@robot_direction
	# end

	# def robot_direction=(robot_direction)
	# 	@robot_direction = robot_direction
	# end
>>>>>>> origin/master
