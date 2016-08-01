require_relative 'robot'
require_relative 'table'

class Commander
	VALID_COMMANDS = ["PLACE [X,Y,VECTOR]", "MOVE", "LEFT", "RIGHT", "REPORT", "BOOM"]

	def initialize
		@table = Table.new
		@robot = Robot.new(@table)
	end

	def greeting
		puts "Welcome commander. The table is at risk of invasion and we require your expertise to navigate a robot to save the world."
		puts "The robot is ready to be placed. I'm sure you already know this but to place the robot use a command similar to [PLACE 1,2,EAST]."
		puts "Once the robot is in position we can navigate it around the table."
		puts "The commands it will accept are #{VALID_COMMANDS.join(', ')}. An example is #{VALID_COMMANDS.sample}."
	end

	def valid_command?(command)
		VALID_COMMANDS.include?(command)
	end

	def input_command
		loop do
			puts "Please enter a command..."
			give_command(gets.chomp.upcase)
		end
	end

	def give_command(command)
		if command.start_with? "PLACE"
			place(command)
		elsif !valid_command?(command)
			puts "Sorry but [#{command}] is not a valid command"
		elsif command == "BOOM"
			boom
		elsif !@robot.robot_placed?
			puts "Sorry but you need to place the robot before [#{command}] will be accepted"
		else
			case command
			when "MOVE" then @robot.move
			when "REPORT" then @robot.report
			when "LEFT" then @robot.rotate("LEFT")
			when "RIGHT" then @robot.rotate("RIGHT")
			#A design decision is made to use rotate(args) to allow for potential scale e.g. rotate("Up") or rotate(180)
			end
		end
	end

	def place(command)
		command.sub!("PLACE", "")
		@x_position, @y_position, @robot_direction = command.split(",")
		@x_position = number_or_nil(@x_position)
		@y_position = number_or_nil(@y_position)
		if valid_placement?
			@robot.location(@x_position, @y_position, @robot_direction)
			puts "The robot has been placed at #{@x_position} #{@y_position} facing #{@robot_direction}. Let\'s go save the world!"
		else
			puts "Sorry the place command is incorrectly formatted or outside the table bounds."
			puts "A place command looks like [ PLACE 0,0,WEST ]"
		end
	end

	def valid_placement?
		@table.is_placement_in_bounds?(@x_position, @y_position) && @robot.vectors.include?(@robot_direction)
	end

	def boom
		puts "ERROR ERROR THIS SHOULD NOT HAVE HAPPENEND!!! BOOOOOOMMM!!!..."
		puts "Your robot exploded... The world is doomed. The end."
		exit
	end

	def number_or_nil(string)
	  Integer(string)
		rescue ArgumentError
	  	nil
	end
	# Prevents againist a non-numberic input in the place command. a.to_i => 0 which could hide an error. Thus instead nil is used.
end
