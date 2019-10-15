require 'pry'

class Player
    attr_accessor :name, :hp
    
    def initialize(name)
        @name = name
        @hp = 10
    end

    def show_state 
      puts "#{name} à #{hp} points de vie."
    end

    def gets_damage(damages)
      @hp -= damages

      if @hp <= 0
        puts "le joueur #{name} a été tué."
      end
    end

    def attacks(player)
      puts "le joueur #{name} attaque le joueur #{player.name}."
      damage_var = compute_damage  
      puts "Il lui inflige #{damage_var} points de dégâts."
      player.gets_damage (damage_var)
    end

    def compute_damage
        return rand(1..6)
      end
end