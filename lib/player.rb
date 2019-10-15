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

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize (name)
    @weapon_level = 1
    @hp = 100
    @name = name
  end

  def show_state 
    puts "#{name} à #{hp} points de vie et une arme de niveau #{weapon_level}."
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_level}"
    if new_level > @weapon_level
      puts "Enfin une arme puissante, je garde !"
      @weapon_level = new_level
    else
      puts "Bon sang... Cette arme est NULLE ! Tant pis, je garde l'autre."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack >= 2 && health_pack <= 5
      @hp += 50
      "Jolie trouvaille, un pack de vie +50 :)"
    elsif health_pack == 6
      @hp += 80
      "Styley, un pack de vie +80 ! BG ;)"
    else
      puts "Tu n'as rien trouvé déso :/"
    end
  end
end