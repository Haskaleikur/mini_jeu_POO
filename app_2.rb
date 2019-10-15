require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "--------------------"
puts "JOB'S DONE"
puts "WHO WILL FINISH THE JOB FASTER?"
puts "--------------------"
puts
puts "Choose your fighter's name"
puts
new_player = HumanPlayer.new(gets.chomp.to_s)
puts
enemies = [enemie1 = Player.new("José"), enemie2 = Player.new("Josiane")]

while new_player.life_points >0 && (enemie1.life_points > 0 || enemie2.life_points >0)

    if enemie1.life_points == 0 || new_player.life_points == 0

        break

    end

    puts new_player.show_state
    puts
    puts "What do you wanna do?"
    puts
    puts "a - look for a better weapon"
    puts "h - look for healthpack"
    puts
    puts "Attack a player in sight"
    puts
    puts "0 - #{enemie1.show_state}"
    puts "1 - #{enemie2.show_state}"
    puts
    
    player_choice = gets.chomp.to_s
    puts
    case 

        when player_choice == "a" 

            new_player.search_weapon
        
        when player_choice == "h"

            new_player.search_health_pack

        when player_choice == '0'

            new_player.attacks(enemie1)
    
        when player_choice == "1"

            new_player.attacks(enemie2)
        
    end

    puts
    puts 
    
    if enemie1.life_points > 0 || enemie2.life_points >0   
            
            puts "Enemies attack"
            
        else

            print ""

        end

    puts 

    enemies.each do |x|

        x.attacks(new_player) if x.life_points > 0 
    
    end 
    puts
    case

        when new_player.life_points <= 0 

            puts "YOU DIED YOU PIECE OF SHIT"

        when enemie1.life_points <= 0 && enemie2.life_points <= 0

            puts "CONGRATULATIONS JOB'S DONE"

    end

end



