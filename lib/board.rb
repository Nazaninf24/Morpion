require_relative 'player'
require_relative 'game'

class Board < Player
	attr_accessor :case

	def initialize
		@case =  ["1","2","3","4","5","6","7","8","9",]
		@case1 = ["","","","","","","","",""]
	end

	def menu
     puts "Quelques case veux tu remplir ?"
     puts
puts "#{@case[0]} | #{@case[1]} | #{@case[2]}
----------                          
#{@case[3]} | #{@case[4]} | #{@case[5]}
----------              
#{@case[6]} | #{@case[7]} | #{@case[8]}"
puts
	end

	def input_to_index(input)
    input.to_i - 1 #lorque l'utilisateur va entrer un chiffre entre 1 et 9 il faut enlever 1 car le array commence à 0
  end

  def move(position, cross='X',round='O') #A chaque coup on remplace l'index du tableau par un croix (token)
    @case1[position] = cross
  end

  def position_taken?(input) #on verifie que la position donnée par l'utilisateur ne soit pas deja prise
    @case1[input] == "X" || @case1[input] == "O"
  end

  def valid_move?(input) #on verifie que l'input de l'utilisateur soit bien valide (pas deja pris) et compris entre 1 et 9
    input.between?(0, 8) && !position_taken?(input)
  end

  def turn
  	turn = 0
    puts "Choisie un chiffre de 1 à 9 (1 => en haut à gauche)"
    spot = gets.strip #on demande à l'utilisateur choisir la case
    spot = input_to_index(spot) #on utilise la methode pour soustraire de 1 afin de faire reference au bon index du tableau
    if valid_move?(spot) #on vérifie si le move est valide
      move(spot, who_turn) #(spot = index du tableau, current_player = 'X' ou 'O')
    elsif !valid_move?(spot) #si invalide on envoit ce message
      puts "\nENTRE 1 & 9\n\nTRY AGAIN !\n\n"
    else #si oui on passe au tour suivant
      turn
    end #on montre le board a chaque nouveau tour
    display_board
  end

  def turn_count
  	count = 0
  	@case1.each do |i|
  		if i == "X" || i == "O"
  			count += 1
  		end
  	end
  	return count
  end

  def who_turn
  		player = nil
    if turn_count() % 2 == 0 #la team "X" joue tous les tours pairs
      player = 'X'
    else
      player = 'O' #la team "O" joue les tous impairs
    end
    return player
  end


	def display_board

puts "#{@case1[0]} | #{@case1[1]} | #{@case1[2]}
---------                          
#{@case1[3]} | #{@case1[4]} | #{@case1[5]}
---------            
#{@case1[6]} | #{@case1[7]} | #{@case1[8]}"
	end

    def win?
	  win = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [6, 4, 2], [0, 4, 8]] #toutes les combinaisons gagnantes
    win.detect do |combo|
      @case1[combo[0]] == @case1[combo[1]] &&
      @case1[combo[1]] == @case1[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full? #si le nombre de tour est égal à 9 alors le morpion est complet
    turn_count == 9
  end

  def draw? #pour checker les cas d'égalité
    !win? && full? #inverse d'un partie gagnée et si les 9 coups ont été atteints
  end

  def over? #toutes les possibilités pour mettre fin au jeu
    win? || full? || draw?
  end

	def play
		menu
		until over?
    turn
    end
  end
end





