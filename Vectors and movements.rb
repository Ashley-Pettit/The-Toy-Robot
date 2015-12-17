class Vectors_and_movements

	def vector
		vector {
		"NORTH":0
		"EAST":1
		"SOUTH":2
		"WEST":3	
		}    
	end

	def move
		if withinbounds
			case robot_direction
			when condition
				then
				
			end

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