require 'bundler'
Bundler.require

require_relative 'lib/board.rb'
require_relative 'lib/game.rb'


#game is supposed to be initialized
def loopGame(game)
    while game.status == 0
        game.displayBoard
        game.turn
    end
    game.game_end
    game.displayBoard
end


puts "Quel est le prénom du joueur 1\n"
joueur1 = gets.chomp
sleep 2
puts "\n\nQuel est le prénom du joueur 2\n"
joueur2 = gets.chomp


game = Game.new(joueur1, joueur2)

play = 1
while play==1
    loopGame(game)
    
    puts "Voulez-vous rejouer ? [o/n]"
    replay = gets.chomp
    if replay == 'o'
        game.new_round
    else
        play = 0
        puts "bye bye"
    end 
end