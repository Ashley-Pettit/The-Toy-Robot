#!/usr/local/bin/ruby

# Welcome to Ashley's Toy Robot! V2.1! 
# Used a hash for the vector with % 4 to allows the robot to rotate through 4 vectors.
# Attempting user focused code with things like .upcase and a seperated report function. 
# You can change the size of the table and the robot/table will function just fine. 
# give_command runs in an infinte loop until 'boom' is entered 

# Testing is with Rspec  ############

require_relative 'Robot'
require_relative 'Table'
require_relative 'VectorsAndMovements'
require_relative 'Feedback'
require_relative 'Testing'

Robot.new()
@vectors = {"NORTH" => 0, "EAST" => 1, "SOUTH" => 2, "WEST" => 3} 
@left_or_right = {"left" => -1, "right" => 1}
