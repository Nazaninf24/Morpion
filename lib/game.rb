#require_relative 'player'
#require_relative '../app'

class Game < Player
	attr_accessor :player1, :player2

	def initialize
		@player1 = player1
		@player2 = player2
	end

	def get_team #demande le noms des deux joueurs et leur attributs un signe (X ou O)
		puts "Comment le premier joueur s'appelle ?"
		@name1 = gets.chomp
		@team1 = "X"
		@player1 = Player.new(@name1, @team1)
		puts
		puts "Comment le deuxième joueur s'appelle ?"
		@name2 = gets.chomp
		@team2 = "O"
		puts
		@player2 = Player.new(@name2, @team2)
		puts "Très bien!"
		puts 
		puts "#{player1.name} a les #{player1.team}"
		puts "et #{player2.name} a les #{player2.team}"
		puts
	end
end



