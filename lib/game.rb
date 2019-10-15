require_relative 'player'

class Game

    attr_accessor :HumanPlayer, :enemies

    def initialize (name)
        @name = name
        @HumanPlayer = HumanPlayer.new(name)
        @enemies = [Player.new("José"),Player.new("Bertrand"),Player.new("Maurice"),Player.new("Albert")]
    end

    def kill_player 
end