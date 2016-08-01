#!/usr/local/bin/ruby

# Welcome - This is just a run file with a few comments :)

# 1 - Class seperation and why?
#For classes are used to isolate responsibilities in a clear fashion. This is done the Sandy Metz way of looking at the nouns!
# This could be further seperated however, I have attempted simplicity in design. Other things that were considered to be seperated were the compass(vectors), I/O and rules. There would be some benefit in isolating these concerns however, also some setbacks.
# My aim was to make the program both scalable yet simple. I found 4 classes would allow for most scale considerations yet still keep the program as simple as possible. Within the classes most functions are easily isolatable such that they could be moved, tested, expanded and reused.
# 2 - An attempt to show scalability and extendability
# Where possible small 'single responsiblity' methods are used such as valid_placement?. These small methods are very easily tested and are re-usable. They are also very readable! :).
# Wherever possible the program is open to scale. One example is when rotating through vectors the program does this via modulo(vectors.length). Whilist this may sound complex at first it means that the number of vectors could change yet still allow the robot to function and rotate through the vectors as intended. Naturally also the table integers can also change without the poor robot falling off.
# 3 - Testing is under spec. To run tests please use 'bundle exec rspec spec'.
# 4 - BOOM was added as a little bit of fun but also to make it convenient to end the program.
# 5 - Left and right are joined as one command called rotate(args). This is done again for scale considerations. If the robot in the future had to rotate(180) or rotate(up) this would be easier to do this enhancement.
# 6 - Ruby to be honest isn't amazing at integer conversion. Thus when turning a string to an integer I have included 'Rescue nil'. Although many rubyists don't like 'rescue nil' this is confined in it's used and is thus unlikely to hide and error. The function will protect againist PLACE 1,a,WEST => Program crash. Rescue nil allows the program to function as intended. Note Interger and .to_i both yield different results. 'A' => 0 was deemed also not correct.
# 7 - This project goes a little beyond the initial spec to attempt to make the program a little more user friendly. Example command.upcase.

require_relative 'lib/commander'

@commander = Commander.new
@commander.greeting
@commander.input_command
