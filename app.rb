require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("José")
player2 = Player.new("Josiane")
player3 = HumanPlayer.new("Berserk")


#début du combat, annonce de l'étât des participants
puts
puts
puts "À ma droite #{player1.name} avec un total de #{player1.show_state}"
puts "À ma gauche #{player2.name} avec un total de #{player2.show_state}"
puts
puts
puts "READYYYYYYYYYY"
puts
puts
puts "FIGHHHHTTTTTTT"
puts
puts
while player1.life_points > 0 && player2.life_points > 0
    
    puts player2.attacks (player1)

        if player1.life_points == 0

        break 

        end


    puts player1.attacks (player2)

end

puts "Game Over"
puts
