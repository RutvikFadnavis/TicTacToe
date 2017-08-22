def display
		
		def print_line
			for k in 0..18
				print "_" unless k%18 == 0
				print " " if k%18 == 0
			end
			print "\n"
		end

		def print_line_space
			for k in 0..18
				print "_" unless k%6 == 0
				print "|" if k%6 == 0
			end
			print "\n"
		end

		def print_space
			for k in 0..18 
				print " " unless k%6 == 0
				print "|" if k%6 == 0
			end
			print "\n"	
		end		

		def print_value
			for k in 0..18
				if(k-3)%6 == 0
					print " " #if empty.include?[i,j]
#					print "X" if Player_X.Xs.include?[i,j]
#					print "O" if Player_O.Os.include?[i,j]
				elsif k%6 == 0 
					print "|"
				else 
					print " "
				end
			end
			print "\n"
		end

		print_line
		for j in 0..2
			print_space
			print_value
			print_line_space
		end
	end

display