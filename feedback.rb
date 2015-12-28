class Feedback

	attr_reader :@user_command
	attr_reader :@robot_direction
	attr_reader :@x_position
	attr_reader :@y_position

	def feedback(i)
		feedback = Array.new
		feedback[0] = "ATTTTEMMMPPTING COMMAND [#{@user_command}]... Okay Dokay, I understand..."
		feedback[command_not_understood] = "ATTTTEMMMPPTING [#{@user_command}] COMMAND... Hrmmmm.... Wait... Nope... Sorry sir but I don't understand you :("
		feedback[not_on_table] = "Wait... Your command is okay but I need to be on the table first. Please use PLACE to put me on the table."
		feedback[place_understood] = "Good Stuff. #{@user_command} was correctly understood. Now... Where would you like to put me down?" 
		feedback[report_without_placed] = "Wait...Dude, I need to be board first. Please enter PLACE to put me down. Many Thanks, The Toy Robot"
		feedback[place_format_invalid] = "Sorry Sir the PLACE command direction format is invalid.\r\n 	
										One more time... Please follow the example format"
		feedback[place_is_off_table] = "Nooooooo your placing me off the table!!! I won't do it! I won\'t! \r\n 
										One more time.... Please PLACE me within the bounds of the table"   
		feedback[placed] = "Okay Sir, I have been placed at #{@x_position} #{@y_position} facing #{@robot_direction}. I\'m ready to move!" ###
		feedback[report] = "Gotcha! Okay... My present location is (#{@x_position}, #{@y_position}) facing #{@robot_direction}. Have a happy day!"
		feedback[rotated] = "Understood Sir. I've rotated to the #{@user_command} {! I'm now ready to move #{@robot_direction}" 
		feedback[moving] = "Okay I\'m moving #{@robot_direction} one space! I\'m now at #{@x_position}, #{@y_position}) and I\'m facing #{@robot_direction}."
		feedback[move_not_in_bounds] = "WAIT!!...NOOOOO!!! I understand you yet...I\'m not doing that. You\'ll drive me off the table!"
		puts feedback(i)
	end

end