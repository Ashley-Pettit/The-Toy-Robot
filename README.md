##THE TOY ROBOT

The most exciting console app you'll ever find!

##ABOUT

The Toy Robot test is a programming excercise that is very popular in Melbourne.
The problem involves making a robot move around a table without falling off.

This solution attempts to show SOLID programming principals and is design to be simple yet scalable.

At the bottom of this readme is the requirements of this coding task.

##HOW TO RUN

1. Download this repo by clicking the download as zip button
2. Unzip the file
4. Ensure you have at least v2.2.2 of ruby installed. You can check by running ruby -v in your terminal/console. Ruby can be downloaded at https://www.ruby-lang.org/en/downloads/
5. With ruby installed navigate to the downloaded unzipped file with your terminal
6. Once in the folder type ruby run.rb and the program will run

##CHALLENGES

1. Deciding which classes to separate is always an interesting one! I've attempted to show a balanced approach aiming for simplicity yet also factoring likely scale. I changed my classes quite a few times trying to decide what made the most sense!

2. Making a robot rotate is harder than might be thought! How do you make a robot turn right from West and then become north? Sure you could hard-code it but that's not a scalable solution.

- My idea was using modulo 4 to allow the robot to rotate through a hash containing the 4 vectors. In a later commit I realised that the hardcoding of a constant four vectors didn't follow single-responsiblity design as an addition of a vector would break the robot's rotation.

- So I'm proud of the final solution here. There is now a compass class and the robot rotates through vectors.length (which is a method inside the compass). This allows the compass to be changed without causing the robot to fail. (Say someone added north-east to vectors. This is now no problemo and would require no change to the robot class).

I've rebuilt the robot a few times. Each time I learn new things I try to rebuild the robot with what I've learnt. Many conversations ands books have infulenced how I have decided to do class seperation and method construction.

##FOCUS ON OBJECT ORIENTATION

Wherever possible there is no hard coding and no coupling. Methods should stand alone and be open for modification without requiring alterations to other functions (where possible).

An example is you can change the table width and height very easily and the robot class will not need adjustments.

The solution is attempted to be done 'The Ruby Way' by incorporating many small functions that can be easily isolated, tested and re-used.

##STILL TO COME

1. An advanced version for fun maybe with some monsters and more robots
2. Maybe a front-end interface
3. Better test coverage

##EXAMPLE USAGE

<img src = "https://github.com/Ashley-Pettit/Toy-RobotV2/blob/master/Capture.JPG?raw=true"/>
