require_relative 'compass'

class Robot
  DIRECTIONS = { left: -1, right: 1 }.freeze

  def initialize(table)
    @table = table
    @compass = Compass.new
  end

  def vectors
    @compass.vectors
  end

  def valid_vector?(vector)
    vectors.include?(vector)
  end

  def set_location(x_position, y_position, robot_direction)
    @x_position = x_position
    @y_position = y_position
    @robot_direction = robot_direction
  end

  def robot_placed?
    !!@x_position
  end

  def rotate(direction)
    new_vector = (vectors[@robot_direction] + DIRECTIONS[direction]) % vectors.length
    @robot_direction = vectors.key(new_vector)
    puts "Understood. I\'ve rotated to the #{direction}! I'm now facing #{@robot_direction}"
  end

  def move
    if valid_move?
      case @robot_direction
      when "NORTH" then @y_position += 1
      when "EAST" then @x_position += 1
      when "SOUTH" then @y_position -= 1
      when "WEST" then @x_position -= 1
      end
      puts "Okay I\'m moving forward one space! I\'m now at #{@x_position}, #{@y_position} facing #{@robot_direction}"
    else
      puts "Nooo! You'd drive me off the table! Command ignored!"
    end
  end

  def report_position
    puts "My present location is #{@x_position}, #{@y_position}) facing #{@robot_direction}."
  end

  def boom
    puts "ERROR ERROR THIS SHOULD NOT HAVE HAPPENEND!!! BOOOOOOMMM!!!..."
    puts "Your robot exploded... The world is doomed. The end."
    exit
  end

  private

  def valid_move?
    @table.move_in_bounds?(@robot_direction, @x_position, @y_position)
  end
end
