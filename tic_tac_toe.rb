class Board
	
	attr_accessor :player_x_moves, :player_o_moves

	def initialize
		@player_x_moves ||= []
		@player_o_moves ||= []

		@X_x ||= 0
		@X_y ||= 0
		@O_x ||= 0
		@O_y ||= 0
	end

	def empty
		full ||= []
		for i in 0..2
			for j in 0..2
				full << [i,j]
			end
		end
		empty ||= full	
		empty -= self.player_x_moves
		empty -= self.player_o_moves

		empty
	end

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

		def print_value(i)
			j=0
			for k in 0..18
				if(k-3)%6 == 0
					print " " if empty.include? [j,i]
					print "X" if self.player_x_moves.include? [j,i]
					print "O" if self.player_o_moves.include? [j,i]
					j+=1
				elsif k%6 == 0 
					print "|"
				else 
					print " "
				end
			end
			print "\n"
		end

		print_line
		for i in 0..2
			print_space
			print_value(i)
			print_line_space
		end
	end

	def group_by_3 (x)
		groups = []
		unless x.nil?
			for i in 0...x.length
				for j in (i+1)...x.length
					for k in (j+1)...x.length
						groups << [x[i],x[j],x[k]]
					end
				end
			end
		end
		groups
	end

	def win
		 win ||="draw"

		 @X_x = 0
		 @X_y = 0
		 @O_x = 0
		 @O_y = 0

		 group_Xs = group_by_3(@player_x_moves)
		 group_Os = group_by_3(@player_o_moves)

		 group_Xs.each do |group|
		 	for i in 0..2
		 		@X_x +=group[i][0]
		 		@X_y +=group[i][1]
		 	end
		 	if ((@X_x%3 == 0)&&(@X_y%3 == 0))
		 		win = "!!!!!!!!!! XXXXXXXXXX !!!!!!!!!!" if (@X_x == @X_y && (group.include? [1,1]))
		 		win = "!!!!!!!!!! XXXXXXXXXX !!!!!!!!!!" unless (@X_x == @X_y) 
		 	end
			@X_x = 0
			@X_y = 0
		 end

		 group_Os.each do |group|
		 	for i in 0..2
		 		@O_x +=group[i][0]
		 		@O_y +=group[i][1]
		 	end
		 	if ((@O_x%3 == 0)&&(@O_y%3 == 0))
		 		win = "!!!!!!!!!! OOOOOOOOOO !!!!!!!!!!" if (@O_x == @O_y && (group.include? [1,1]))
		 		win = "!!!!!!!!!! OOOOOOOOOO !!!!!!!!!!" unless (@O_x == @O_y) 
		 	end
			@O_x = 0
			@O_y = 0
		 end
		 win
	end

end

class Player_X < Board
	def play(position, game)
		game.player_x_moves << position if game.empty.include? position
	end
end

class Player_O < Board
	def play(position, game)
		game.player_o_moves << position if game.empty.include? position
	end
end

play = 0
dutu = Player_X.new
loser = Player_O.new
game = Board.new

game.display
while game.win == "draw" && game.empty != []
	position = []
	puts "Player_X play: "
	x = gets.chomp.split
	x.each { |k| position << k.to_i }
	dutu.play(position, game)
	game.display
	puts
	puts

	if game.win == "draw" && game.empty != []
		position = []
		puts "Player_O play: "
		x = gets.chomp.split
		x.each { |k| position << k.to_i }
		loser.play(position, game)
		game.display
		puts 
		puts
	end
	play +=1
end
puts game.win