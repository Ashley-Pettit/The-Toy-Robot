Ash's Toy Robot

This is my 2nd build of the toy robot and it is very much thanks to the assistance of James McLaren. James didn't write the code however, he constantly gave me feedback and taught me 00 programming. 

Functionally it is virtually the same however, the aim has been to encorporate more eligent code and better structure. 

This build of the toy robot is designed to meet the specifications below. The only additions are.
    You may type place X Y Direction(As per specifications) or just place (Then you'll be prompted)
    The program has a boom command to simply end the program
    The program gives more detailed feedback than the specification required. This is aimed to make it user friendly
    The program uses .upcase and .capitalize for the average user who may right 'left' rather than 'LEFT'

Parts of the spec missed
    This was not built in a TDD fashion. 
    It does however, have lots of testing to ensure the program will functions and will continue to function properly. These tests ideally to follow TDD should have been done at the start of the exercise. 

A few things that I find interesting in the code
    I'm quite proud of the solution here. The problem was making a left turn from north (Deemed 0) to west (Deemed 3). The problem was overcome using a hash of string to integer values and using modulo 4 to keep the bounds of the integers from 0-3. 
    I'm also proud the left and right were combined into the one "rotate" command which merely passes left or right. This saves the use of an unnecessary function
    You can change the table width and height very easily without having any affect on the program. It will run due to this line of code.
        # when "WEST" && (0..@table_width).include?(@x_position - 1) then
    Minus 1 is merely used such that a 5x5 table can be contstructed with the input of 5 rather than 4 (As 0,0 is the first position deemed South West). It leads to a little extra code however, I feel it makes it more understandable. 

REQUIREMENTS

Description:
. The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
. There are no other obstructions on the table surface.
. The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must still
be allowed.
 
. Create an application that can read in commands of the following form -
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
 
. PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.
. The origin (0,0) can be considered to be the SOUTH WEST most corner.
. The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.
. MOVE will move the toy robot one unit forward in the direction it is currently facing.
. LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
. REPORT will announce the X,Y and orientation of the robot.
. A robot that is not on the table can choose to ignore the MOVE, LEFT, RIGHT and REPORT commands.
. Provide test data to exercise the application.
 
 
Constraints:
The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.
 
Example Input and Output:
a)
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH
 
b)
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST
 
c)
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH
 
 
Deliverables:
The source files, the test data and any test code.