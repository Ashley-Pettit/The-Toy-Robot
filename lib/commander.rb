require_relative 'robot'
require_relative 'table'
require_relative 'messages'
require 'pry'

class Commander
  # Using inlcude as technically messages are part of the Commander however,
  # it allows the extraction of long messages which makes code easier to read.
  include Messages

  def initialize
    @table = Table.new
    @robot = Robot.new(@table)
  end

  def input_command
    loop do
      puts "Please enter a command..."
      give_command(gets.chomp.upcase)
    end
  end

  def give_command(command)
    # Duplicate the command so we can give an appropriate place command feedback.
    intial_command = command.dup
    if valid_place_command?(command)
      place_robot(command)
    elsif valid_command?(command) && @robot.robot_placed?
      case command
      when 'BOOM' then @robot.boom
      when 'MOVE' then @robot.move
      when 'REPORT' then @robot.report_position
      when 'LEFT' then @robot.rotate(:left)
      when 'RIGHT' then @robot.rotate(:right)
      end
    else
      # I wanted to give the user more feedback than just sorry your entry failed.
      get_invalid_message(intial_command)
    end
  end

  def place_robot
    @robot.set_location(@x_position, @y_position, @robot_direction)
    robot_placed_message
  end

  private

  def valid_command?(command)
    VALID_COMMANDS.include?(command)
  end

  def valid_place_command?(command)
    command.slice!('PLACE ')
    @x_position, @y_position, @robot_direction = command.split(',')
    # Rescue used in case of potential user input of Non-integer.
    @x_position = Integer(@x_position) rescue ArgumentError
    @y_position = Integer(@y_position) rescue ArgumentError
    @table.placement_in_bounds?(@x_position, @y_position) && @robot.valid_vector?(@robot_direction)
  end
end
