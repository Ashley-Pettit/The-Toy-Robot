class Vectors

	def vector
		vector {
		"NORTH":0
		"EAST":1
		"SOUTH":2
		"WEST":3	
		}    
	end

	def move
		withinbounds
		if @robot_direction == 1 && (0..3).include?(@yPosition) #This prevents a fall
			@yPosition += 1
			feedback[12]
		elsif @robot_direction == 2 && (0..3).include?(@xPosition)
			@xPosition += 1
			feedback[12]
		elsif @robot_direction == 3 && (1..4).include?(@yPosition)
			@yPosition -= 1
			feedback[12]	
		elsif @robot_direction == 4 (1..4).include?(@xPosition)
			@xPosition -= 1
			feedback[12]
		else
			feedback[13]
		end
		giveCommand
	end

	def left
		if vector == "WEST"
			vector = "NORTH"
		else 
			vector -= 1 
		end
		feedback[11]
		giveCommand
	end

	def right
		if vector == "NORTH"
			vector = "WEST" 
		else
			vector.next #or +=
		end
		feedback[11]	
		giveCommand
	end
end