#!/usr/local/bin/ruby

# Welcome to Ash's toy robot!! I wrote this when I first starting coding ruby in October 2015. 
# It may not be perfect code!! It does however, have a BOOM command :)

# This is just verison 1. It is fully functional yet has the following known issues.
# 1 - The code is not properly 00
# 2 - There is room for improvements to stop code repetition with better objects and arrays/hashes/cases
# 3 - There is no testing
# 4 - All set as @ variables when this is likely not needed

def initalize
	#@table = table   Not in use yet. For V2
	@robotPlaced = false
	intro
end

def intro
	puts "Good Morning Sir! I am the Toy Robot!"
	giveCommand
end

def giveCommand
	if @firstCommand
		puts "I'm awaiting your command! These are the commands I understand. PLACE / MOVE / LEFT / RIGHT / REPORT. An example is REPORT"
		@firstCommand = false
	else 
		puts "How about another command? PLACE / MOVE / LEFT / RIGHT / REPORT."
	end
	@userCommand = gets.chomp.upcase #To help if user writes lower case
	if @userCommand == "MOVE" || @userCommand == "LEFT" || @userCommand == "RIGHT" || @userCommand == "PLACE" || @userCommand == "BOOM" || @userCommand == "REPORT"
		puts "ATTTTEMMMPPTING COMMAND [#{@userCommand}]... Okay Dokay, I understand..."
		if @userCommand == "REPORT" && !@robotPlaced
			puts "Wait...Dude, I need to be board first. Please enter PLACE to put me down. Many Thanks, The Toy Robot"
			giveCommand
		elsif @userCommand == "PLACE" 
			puts "Good Stuff. [PLACE] was correctly understood. Now... Where would you like to put me down?" 
			place            
		elsif !@robotPlaced
			puts "Wait... Your command is okay but I need to be on the table first. Please use PLACE to put me on the table."
			giveCommand
		elsif @userCommand == "MOVE"
				move
		elsif @userCommand == "LEFT"
			left
		elsif @userCommand == "RIGHT"
			right
		elsif @userCommand == "REPORT"
			report
		elsif @userCommand == "BOOM"
			boom
		else
			errorDetected
		end
	else
		puts "ATTTTEMMMPPTING [#{@userCommand}] COMMAND... Hrmmmm.... Wait... Nope... Sorry sir but I don't understand you :("
		giveCommand
	end
end


def place
	puts "I understand [0-4], [0-4], [NORTH, EAST, SOUTH or WEST]. An example is 0 0 WEST"
	@commandPlace = gets.chomp
	x, y, @robotDirection = @commandPlace.split(" ") 
	@xPosition = Integer x rescue nil
	@yPosition = Integer y rescue nil 
	if @xPosition.nil? || @yPosition.nil? # This prevents an entry of a string such as "SOUTH 1 SOUTH" => nil 1 SOUTH => errorDetected
		puts "Sorry Sir the PLACE command direction format is invalid."  
		puts "One more time... Please follow the example format"
		place
	else
		if @robotDirection == "NORTH" || @robotDirection == "EAST" || @robotDirection == "SOUTH" || @robotDirection == "WEST"
			if (0..4).include?(@xPosition) && (0..4).include?(@yPosition)
				puts "Okay Sir, I have been placed at #{@xPosition} #{@yPosition} facing #{@robotDirection}. I'm ready to move!"
				@robotPlaced = true
				giveCommand
			elsif !(0..4).include?(@xPosition) || !(0..4).include?(@yPosition) 
				puts "Nooooooo your placing me off the table!!! I won't do it! I won't!" 
				puts "One more time.... Please PLACE me within the bounds of the table"
				place
			else 
				puts "Sorry Sir the PLACE command direction format is invalid."  
				puts "One more time... Please follow the example format"
				place
			end
		else 
			puts "Sorry Sir the PLACE command direction format is invalid."  
			puts "One more time... Please follow the example format"
			place
		end			
	end
end


def move
	if @robotDirection == "NORTH" && (0..3).include?(@yPosition) #This prevents a fall
		@yPosition += 1
		puts "Okay I'm moving up 1! I'm now at I'm now at (#{@xPosition}, #{@yPosition}) facing #{@robotDirection}"
	elsif @robotDirection == "EAST" && (0..3).include?(@xPosition)
		@xPosition += 1
		puts "Okay I'm moving right 1! I'm now at (#{@xPosition}, #{@yPosition}) facing #{@robotDirection}."
	elsif @robotDirection == "SOUTH" && (1..4).include?(@yPosition)
		@yPosition -= 1
		puts "Okay I'm moving down 1! I'm now at (#{@xPosition}, #{@yPosition}) facing #{@robotDirection}."
	elsif @robotDirection == "WEST" && (1..4).include?(@xPosition)
		@xPosition -= 1
		puts "Okay I'm moving left 1! I'm now at (#{@xPosition}, #{@yPosition}) facing #{@robotDirection}."
	else
		puts "WAIT!!...NOOOOO!!! I understand you yet...I'm not doing that. You'll drive me off the table!"
	end
	giveCommand
end

def left
	if	@robotDirection == "NORTH"
		@robotDirection = "WEST"
	elsif @robotDirection == "WEST"
		@robotDirection = "SOUTH"
	elsif @robotDirection == "SOUTH"
		@robotDirection = "EAST"
	elsif @robotDirection == "EAST"
		@robotDirection = "NORTH"
	else 
		errorDetected
	end
	puts "Understood Sir. I've rotated to the left! I'm now ready to move #{@robotDirection}" 
	giveCommand
end

def right
	if	@robotDirection == "NORTH"
		@robotDirection = "EAST"
	elsif @robotDirection == "EAST"
		@robotDirection = "SOUTH"
	elsif @robotDirection == "SOUTH"
		@robotDirection = "WEST"
	elsif @robotDirection == "WEST"
		@robotDirection = "NORTH"
	else 
		errorDetected
	end
	puts "I understand! Okay I've rotated to the right! I'm now facing #{@robotDirection}" 
	giveCommand
end

def report
	puts "Gotcha! Okay... My present location is (#{@xPosition}, #{@yPosition}) facing #{@robotDirection}. Have a happy day!"
	giveCommand
end

def boom
	errorDetected 
end


def errorDetected  #Failsafe. Will restart application.
	puts "ERROR ERROR ERROR THIS SHOULD NOT HAVE HAPPENED!!!! BOOOOMMM!! RESTARTING PROGRAM"
	initalize
end

initalize
