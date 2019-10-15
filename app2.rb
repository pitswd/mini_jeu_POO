require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

enemy1 = Player.new("Josiane")
enemy2 = Player.new("José")
enemies = [enemy1, enemy2]

puts "_______________________________" #welcome screen to the game here
puts "|-----Dungeons & Josiane------|"
puts "| A revolutionary game py Polo|"
puts "|But du jeu : péter la gueule |"
puts "|      De José et Josiane     |"
puts "|    (ces gros blaireaux)     |"
puts "_______________________________"
puts " "

puts "- Menu de création du personnage -" #select a name screen
puts "Comment voulez-vous vous appeler ?"
print ">"
id = gets.chomp
human = HumanPlayer.new("#{id}")

puts "Bienvenue, #{id}, dans... DUNGEONS & JOSIANE !"
puts "______________________________"

puts "Voici l'état initial de nos joueurs :" #first screen showing 
enemy1.show_state
enemy2.show_state
human.show_state

puts " " #a lot of '"puts"' to give space to the user to read between each steps of the fight
puts "******************************"
puts "Passons à la phase de combat !"
puts "******************************"

while human.hp >0 && (enemy1.hp > 0 || enemy2.hp >0) #big loop where all the fight is happening

  puts " " #the next few lines are showing the initial stats of each players
  human.show_state
  enemy1.show_state
  enemy2.show_state
  puts " "
  puts "________"

  puts "Que souhaites-tu faire ce tour-ci ? (choisis la touche correspondante)" #menu where the player chose what s.he's going to do next
  puts " "
  puts "Attaquer un joueur en vue :"
  puts "  1 : Attaquer #{enemy1.name}"
  puts "  2 : Attaquer #{enemy2.name}"
  puts " "
  puts "Chercher un bonus :"
  puts "  3 -- chercher une meilleure arme"
  puts "  4 -- chercher à se soigner "
 
  print ">" #the player enter the input, then the if loop reacts according to this
  action = gets.chomp
  

  if action == "4" #calling the search_health_pack method in player.rb
    human.search_health_pack
    puts " "
    
  elsif action == "3" #calling the search_weapon method in player.rb
    human.search_weapon
    puts " "

  elsif action == "1" #calling the attacks method in player.rb, put acts only for player1
    puts "Tu attaques #{enemy1.name}:"
    human.attacks(enemy1)
    puts " "

  elsif action == "2" #calling the attacks method in player.rb, put acts only for player2
    puts "Tu attaques #{enemy2.name}:"
    human.attacks(enemy2)
    puts " "
    end

  
  enemies.each do |enemy| #each turn, every enemy is attacking, unless is dead
    if enemy.hp > 0
      puts "Les ennemis t'attaquent !"
      enemy.attacks(human)
    end
  end
end

puts " " #winner splash screen
puts "_______________________________"
puts "|                             |"
puts "|    t'es un.e champion.ne    |"
puts "|                             |"
puts "_______________________________"
puts " "
puts "Bien fait pour votre gueule José et Josiane"