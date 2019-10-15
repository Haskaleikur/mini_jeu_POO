
class Player

    attr_accessor :name, :life_points

    def initialize (name)
        @name = name
        @life_points = 10
    end

    def show_state 

        if @life_points > 0
            
            return "#{@name} a #{@life_points} points de vie" 
            
        else

            return "#{name} a été éliminé"
        
        end
        
    end

    def gets_damage(life_points_change)

        @life_points -= life_points_change.to_i

    if @life_points <= 0 

        puts "Game Over, le joueur #{@name} a été tué"
    
    else

        return @life_points
    
    end

    end

    def attacks (player_attacked_id)
        puts
        puts "#{@name} attaque le joueur #{player_attacked_id.name}"
        puts
        damage_inflicted = compute_damage

        player_attacked_id.life_points -= damage_inflicted
        puts
        puts "Il lui infige #{damage_inflicted} points de dégâts"
        puts
        puts player_attacked_id.show_state

    end

    def compute_damage

        return rand(1..6)

    end

end


class HumanPlayer < Player

    attr_accessor :weapon_level

    def initialize (name) 
        
        super (name)

            @weapon_level = 1
            @life_points = 100

    end

    def show_state
            puts
            return "Le joueur #{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
            puts
    end

    def compute_damage

            rand(1..6) * @weapon_level

    end

    def search_weapon 

            weapon_level = rand(1..6) 

            puts "Génial tu as trouvé une nouvelle arme de niveau #{weapon_level}"

        if weapon_level > @weapon_level 

            @weapon_level = weapon_level 

            puts "Grâce à elle tu infligeras encore plus dégâts, tu la prends"

        else 
            puts "Malheureusement cette arme n'est pas meilleure que celle que tu possèdes, une prochaine fois!"

        end

    end

    def search_health_pack 

        health_pack_life_points = rand(1..6)

        case 

        when health_pack_life_points == 1 
            
            puts "Malheureusement tu n'as rien trouvé"

        when health_pack_life_points >= 2 && health_pack_life_points <= 5 && @life_points <= 50
            
            @life_points += 50 
            
            puts "Bravo tu as trouvé un pack de +50 points de vie"
        
        when health_pack_life_points >= 2 && health_pack_life_points <= 5 && @life_points >= 50

            @life_points = 100

            puts "Bravo tu as trouvé un pack de +50 points de vie"
        
        when health_pack_life_points == 6 && @life_points <= 20

            puts "Bravo tu as trouvé un pack de +80 points de vie"

            @life_points += 80


        when health_pack_life_points == 6 && @life_points >= 20
            
            puts "Bravo tu as trouvé un pack de +80 points de vie"

            @life_points = 100
      
        end
    end

end

