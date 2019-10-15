require 'pry'

class Player #class defining the ennemies José and Josiane
    attr_accessor :name, :hp
    
    def initialize(name)
        @name = name
        @hp = 10
    end

    def show_state #this method is used several time to remind the remaining hp of the enemies
      puts "#{name} à #{hp} points de vie."
    end

    def gets_damage(damages) #method defining the number of damages dealed by the player and the enemies
      @hp -= damages

      if @hp <= 0
        puts "le joueur #{name} a été tué."
      end
    end

    def attacks(player) #method used for the main fight, either between ther ennemies in app.rb or between the enemies and the player in app2.rb
      puts "le joueur #{name} attaque le joueur #{player.name}."
      damage_var = compute_damage  
      puts "Il lui inflige #{damage_var} points de dégâts."
      player.gets_damage (damage_var)
    end

    def compute_damage #generating random damages in each turn
        return rand(1..6)
      end
end

class HumanPlayer < Player #class used in app2.rb to define the human player
  attr_accessor :weapon_level

  def initialize (name) #same as Player
    @weapon_level = 1
    @hp = 100
    @name = name
  end

  def show_state #same as Player
    puts "#{name} à #{hp} points de vie et une arme de niveau #{weapon_level}."
  end

  def compute_damage #same as Player, but with the weapon modifier
    rand(1..6) * @weapon_level
  end

  def search_weapon #used to change the main weapon of HumanPlayer and its power
    new_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_level}"
    if new_level > @weapon_level
      puts "Enfin une arme puissante, je garde !"
      @weapon_level = new_level
    else
      puts "Bon sang... Cette arme est NULLE ! Tant pis, je garde l'autre."
    end
  end

  def search_health_pack #Used by HumanPlyer to gain health
    health_pack = rand(1..6)
    if health_pack >= 2 && health_pack <= 5
      @hp += 50
      if @hp >100
        @hp = 100
      end
      "Jolie trouvaille, un pack de vie +50 :)"
    elsif health_pack == 6
      @hp += 80
      "Styley, un pack de vie +80 ! BG ;)"
    else
      puts "Tu n'as rien trouvé déso :/"
    end
    if @hp >100 #this "if" is used to be sure the HumanPlayer never as more than 100 health points
      @hp = 100
    else
    end 
  end
end