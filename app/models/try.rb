class Try < ApplicationRecord
	belongs_to :frame

	def self.calculate_score
		input = Try.pluck(:try_1,:try_2)
		# input = [[10, 0], [10, 0], [5, 5], [8, 2], [10, 0], [9, 0], [6, 0], [10, 0], [10, 0], [7, 3], [10, 7]]
		final_total = 0
		each_frames_score = []
		input.each_with_index do |frame_score,index| #looping through the array of arrays, that is the uncalculated frame score in an array format
			if self.is_value?(index) # goes in only if the array length is less than 10 (that is 10 frames)
				frame_total = 0 # initial frame total value
				if frame_score[0] == 10 # Goes inside the block only if the score of first try of the frame is strike
					frame_total += 10 #adds to the current frame total
					if input[index+1][0] == 10 #if it was a strike, then have to move to next frame. Here, checking the first try is also a strike
						frame_total += input[index+1][0] #adds to the current frame total
						if input[index+1][1] != 10 #if the second try's value of a frame is not a strike, then adding it to the frame_total
							frame_total += input[index+2][0].to_i
						else #if it was a strike, then adding next successive frame's first try value.
							frame_total += input[index+1][1].to_i
						end
					else # If it was a spare, then we are checking if the next frame's first try value and add it's respective values.
						index_val = input[index+1]
						frame_total += index_val[0].to_i
						frame_total += index_val[1].to_i
					end
				elsif self.is_value?(frame_score[0])  # Goes inside the block only if the score of the frame is less than 10 
					frame_total += frame_score[0].to_i # add the current frame total values
					if self.is_spare?(frame_score[0], frame_score[1]) # if the second try is a spare, then it will add the next successive value
						frame_total += (frame_score[1].to_i)
						if index != 10 #this will execute only if the last frame values are either strike or spare
							frame_total += input[index+1][0].to_i
						end
					else
						frame_total += frame_score[1].to_i
					end
				elsif self.is_value?(frame_score[0]) & self.is_value?(frame_score[1]) # If it was neither strike nor spare, then the two values of the current frame will be added to each other
					frame_total += frame_score[0].to_i + frame_score[1].to_i
				end
				# p "Frame #{index+1} score is : #{frame_total}" # Here is the display of each frame scores
				each_frames_score << "Frame #{index+1} score is : #{frame_total}"
				final_total += frame_total.to_i
			end			
		end
		p "Overall score is : #{final_total}"
		return each_frames_score, final_total
	end

	#Method to check if the value is a spare
	def self.is_spare?(val_1,val_2)
		val_1 + val_2 == 10
	end
	#Method to check if the value is neither striker nor spare
	def self.is_value?(value)
		value.to_i < 10
	end
end