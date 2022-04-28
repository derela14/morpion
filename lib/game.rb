require 'bundler'
Bundler.require

require_relative 'board.rb'

#status: 0=on going, 1=victoire du joueur 1, 2=victoire du joueur 2, 3=match nul
class Game
    #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
    attr_accessor :joueur1,:joueur2,:board,:joueurCourant,:status,:premierJoueur
    def initialize(joueur1,joueur2)
        @joueur1=joueur1
        @joueur2=joueur2
        @joueurList = [@joueur1,@joueur2]
        @board=Board.new()
        @joueurCourant = 1
        @status = board.test_Status()
        @premierJoueur = 1
      #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
    end
  
    # return 0 si non fini
    # return 1 si terminé
    # redondant avec l'attribut status, mais ça coute rien
    def turn
        correct_case=0
        while correct_case==0
            puts "c'est au tour de #{@joueurList[@joueurCourant-1]}, entrez une _case entre 0 et 8:"
            caseNbr = gets.chomp.to_i
            if caseNbr >=0 && caseNbr <9
                correct_case = 1
            end
            if correct_case == 1
                result = @board.play_turn(@joueurCourant,caseNbr)
                if result == 0
                    puts "Case déjà prise"
                    correct_case = 0
                end
            end
        end
        @status = board.test_Status()
        if @status == 0
            if @joueurCourant == 1
                @joueurCourant = 2
            else
                @joueurCourant = 1
            end
            return 0
        else
            return 1
        end 
      #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
    end
  
    def new_round
        # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
        @board = Board.new()
        if @premierJoueur == 1
            @premierJoueur = 2
        else
            @premierJoueur = 1
        end
        @joueurCourant = @premierJoueur
        @status=0
    end
  
    def game_end
        if @status == 1
            puts "#{@joueur1} a gagné"
            return 1
        end
        if @status == 2
            puts "#{@joueur2} a gagné"
            return 2
        end
        if @status == 3
            puts "match nul"
            return 3
        end
        return 0
      # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
    end    
  
    def displayBoard
        puts "#{@board.case_list[0]}  #{@board.case_list[1]}  #{@board.case_list[2]}\n"
        puts "#{@board.case_list[3]}  #{@board.case_list[4]}  #{@board.case_list[5]}\n"
        puts "#{@board.case_list[6]}  #{@board.case_list[7]}  #{@board.case_list[8]}\n" 
    end
end

#binding.pry