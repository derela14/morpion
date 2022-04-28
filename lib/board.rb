require 'bundler'
Bundler.require


class Board
    #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
    attr_accessor :case_list
    #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
  
  
    def initialize
      #TO DO :
      @case_list = [0,0,0,0,0,0,0,0,0]
      #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
      #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
    end
  
    #renvoie 0 si coup invalide
    #renvoie 1 si ok
    def play_turn(joueur,caseNbr)
        #joueur vaut 1 ou 2
        #case est un entier entre 0 et 8
        #tester si la case est vide:
        if @case_list[caseNbr]!=0
            return 0
        else
            @case_list[caseNbr]=joueur
            return 1
        end
      #TO DO : une méthode qui :
      #1) demande au bon joueur ce qu'il souhaite faire
      #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
    end
  
    #retourne 1 ou 2 si le joueur correspondant a gagné
    #retourne 3 si match nul
    #retourne 0 sinon
    def test_Status
        #test victory
        for k in 0..2 do
            if @case_list[3*k] != 0 && @case_list[3*k] == @case_list[3*k+1] && @case_list[3*k+1] == @case_list[3*k+2]
                return @case_list[3*k]
            end
        end
        for k in 0..2 do
            if @case_list[k] != 0 && @case_list[k] == @case_list[k+3] && @case_list[k+3] == @case_list[k+6]
                return @case_list[k]
            end
        end
        if @case_list[0] != 0 && @case_list[4] == @case_list[0] && @case_list[4] == @case_list[8]
            return @case_list[0]
        end
        if @case_list[2] != 0 && @case_list[2] == @case_list[4] && @case_list[4] == @case_list[6]
            return @case_list[2]
        end
        if @case_list.include?(0)
            return 0
        else
            return 3
        end
      #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
    end
end


