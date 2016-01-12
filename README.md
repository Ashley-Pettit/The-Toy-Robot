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


So I did a lot 