class Feedback

	def self.feedback(feedback_name)
		feedback = {
		"command_understood" => "ATTTTEMMMPPTING COMMAND [#{@user_command}]... Okay Dokay, I understand...",
		"command_not_understood" => "ATTTTEMMMPPTING [#{@user_command}] COMMAND... Hrmmmm.... Wait... Nope... Sorry sir but I don't understand you :(",
		"not_on_table" => "Wait... Your command is okay but I need to be on the table first. Please use PLACE to put me on the table.",
		"place_understood" => "Good Stuff. #{@user_command} was correctly understood. Now... Where would you like to put me down?" ,
		"place_format_invalid" => "Sorry Sir the PLACE command direction format is invalid.\n
										One more time... Please follow the example format",
		"place_is_off_table" => "Nooooooo your placing me off the table!!! I won't do it! I won\'t! \n 
										One more time.... Please PLACE me within the bounds of the table",   
		"placed" => "Okay Sir, I have been placed at #{@x_position} #{@y_position} facing #{@robot_direction}. I\'m ready to move!",
		"report" => "Gotcha! Okay... My present location is (#{@x_position}, #{@y_position}) facing #{@robot_direction}. Have a happy day!",
		"report_without_placed" => "Wait...Dude, I need to be board first. Please enter PLACE to put me down. Many Thanks, The Toy Robot",
		"rotated" => "Understood Sir. I've rotated to the #{@user_command} {! I'm now ready to move #{@robot_direction}",
		"moving" => "Okay I\'m moving #{@robot_direction} one space! I\'m now at #{@x_position}, #{@y_position}) and I\'m facing #{@robot_direction}.",
		"move_not_in_bounds" => "WAIT!!...NOOOOO!!! I understand you yet...I\'m not doing that. You\'ll drive me off the table!"
		}
		puts feedback[feedback_name]
	end

	def information_storage
		@x_position
		@y_position
		@robot_direction
	end

	# Note using info storage is the way I chose to do this. I could have used attr accessor. The alternative is passing way too many variables which would look messy

end