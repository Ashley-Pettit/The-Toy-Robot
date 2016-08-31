# extracted as to improve code readability
module Messages
  VALID_COMMANDS = ["PLACE", "MOVE", "LEFT", "RIGHT", "REPORT", "BOOM"].freeze

  def greeting_message
    puts "Welcome commander. The table is at risk of invasion and we require your expertise to navigate a robot to save the world."
    puts "The robot is ready to be placed. I\'m sure you already know this but to place the robot use a command similar to [PLACE 1,2,EAST]."
    puts "Once the robot is in position we can navigate it around the table."
    puts "The commands it will accept are #{VALID_COMMANDS.join(', ')}. An example is #{VALID_COMMANDS.sample}. A PLACE command example is PLACE 0,0,EAST"
  end

  def robot_placed_message
    puts "The robot has been placed at #{@x_position} #{@y_position} facing #{@robot_direction}. Let\'s go save the world!"
  end

  def get_invalid_message(command)
    if command.include?("PLACE")
      incorrect_placement_message
    elsif !valid_command?(command)
      invalid_command_message(command)
    elsif !@robot.robot_placed?
      robot_not_placed_message
    else
      raise 'An unknown error has occured. Please restart the program'
    end
  end

  def incorrect_placement_message
    puts "Sorry the place command is incorrectly formatted or outside the table bounds"
    puts "A place command looks like [ PLACE 0,0,WEST ]"
  end

  def invalid_command_message(command)
    puts "Sorry but [#{command}] is not a valid command"
  end

  def robot_not_placed_message
    puts "Sorry but you need to place the robot before you can do that."
  end
end
