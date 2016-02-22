
<b>THE TOY ROBOT - Ashley Pettit </b>

This is my second build of the toy robot and it is very much thanks to the assistance of James McLaren from Arcade. James taught me 00 programming and is an awesome guy :) 

<b>THE TOY ROBOT</b>

<b> ABOUT </b>

This is my second build of the toy robot and it is very much thanks to the assistance of James McLaren. James taught me 00 programming. 

Functionally this toy robot is virtually the same as my verison 1. The aim has been to encorporate more eligent code and better structure. 

At the bottom of this readme is the requirements of this coding task. 

<b>ADDITIONS OUT OF SCOPE</b>

<ul>
    <li>You may type place X Y VECTOR (As per the specification) or just place (Then you'll be prompted for where to place)</li>
    <li>The program has a boom command to simply end the program</li>
    <li>The program gives more detailed feedback than the specification required. This is aimed to make it user friendly</li>
    <li>The program uses .upcase and .capitalize for the average user who may write 'left' rather than 'LEFT'</li>
</ul>

<b> CHALLENGES </b> 

Getting the robot to rotate without hard coding was initially a challenge. Hard coding of West + right => North would be easy but is not eligant code. 

I'm quite proud of the solution here. The problem was overcome using a hash of string to integer values and using modulo 4 to keep the bounds of the keys to 0-3 and match the corresponding vector value. 

<b> FOCUS ON OBJECT ORIENTATION </b>

Wherever possible there is no hard coding. 

An example is you can change the table width and height very easily and the robot will run just fine. 

<b> SPEC MISSED / LIMITATIONS </b>

This build of the toy robot is designed to meet the specifications below. 

The only additions are:
<ul>
    <li>You may type place X Y Direction(As per the specification) or just place (Then you'll be prompted for where to place)</li>
    <li>The program has a boom command to simply end the program</li>
    <li>The program gives more detailed feedback than the specification required. This is aimed to make it user friendly</li>
    <li>The program uses .upcase and .capitalize for the average user who may write 'left' rather than 'LEFT'</li>
</ul>

<b> CHALLENGES </b> 

Getting the robot to rotate without hard coding was initially a challenge. Hard coding of West + right => North would be easy but is not eligant code. 

I'm quite proud of the solution here. The problem was overcome using a hash of string to integer values and using modulo 4 to keep the bounds of the integers from 0-3. 

<b> FOCUS ON OBJECT ORIENTATION </b>

Wherever possible there is zero hard coding. It may have been immediately easier but it's not ideal for supportable code.

An example is you can change the table width and height very easily and the robot will run just fine. 

<b> SPEC MISSED / LIMITATIONS </b>

<ol>
    <li> This was not built in a TDD fashion and lacks unit testing. </li>
    <li> The program is longer than most. I did this to make it more user friendly yet the code is longer. </li>
    <li> Only two classes were used. I originally had more but felt it added rather than removed complexity. </li>
    <li> There is overuse of class variables rather that passing information. </li>
</ol>

<b> HOW TO RUN THE FILE </b>

<ol>
    <li> You will need ruby installed on your computer. For windows users this may need to be downloaded via rubyinstaller.org. For Mac users you are likely to already have ruby installed. </li>
    <li> Press download zip and unzip to your desktop
    <li> Open terminal or command prompt </li>
    <li> Navigate to the downloaded unzipped file (Using cd) </li>
    <li> Once in the correct folder type ruby robot.rb </li>
</ol>

<b> REQUIREMENTS OF THE ASSIGNMENT </b>

Description:


. The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
. There are no other obstructions on the table surface.
. The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must still
be allowed.

 
Create an application that can read in commands of the following form


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
