require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

enemy1 = Player.new("Josiane")
enemy2 = Player.new("José")
enemies = [enemy1, enemy2]

puts "_______________________________"
puts "|-----Dungeons & Josiane------|"
puts "| A revolutionary game py Polo|"
puts "|But du jeu : péter la gueule |"
puts "|      De José et Josiane     |"
puts "|    (ces gros blaireaux)     |"
puts "_______________________________"
puts " "

puts "- Menu de création du personnage -"
puts "Comment voulez-vous vous appeler ?"
print ">"
id = gets.chomp
human = HumanPlayer.new("#{id}")

puts "Bienvenue, #{id}, dans... DUNGEONS & JOSIANE !"
puts "______________________________"

puts "Voici l'état initial de nos joueurs :"
enemy1.show_state
enemy2.show_state
human.show_state

puts " "
puts "******************************"
puts "Passons à la phase de combat !"
puts "******************************"

while human.hp >0 && (enemy1.hp > 0 || enemy2.hp >0)

  puts " "
  human.show_state
  enemy1.show_state
  enemy2.show_state
  puts " "
  puts "________"

  puts "Que souhaites-tu faire ce tour-ci ? (choisis la touche correspondante)"
  puts " "
  puts "Attaquer un joueur en vue :"
  puts "  1 : Attaquer #{enemy1.name}"
  puts "  2 : Attaquer #{enemy2.name}"
  puts " "
  puts "Chercher un bonus :"
  puts "  3 -- chercher une meilleure arme"
  puts "  4 -- chercher à se soigner "
 
  print ">"
  action = gets.chomp
  

  if action == "4"
    human.search_health_pack
    puts " "
    
  elsif action == "3"
    human.search_weapon
    puts " "

  elsif action == "1"
    puts "Tu attaques #{enemy1.name}:"
    human.attacks(enemy1)
    puts " "

  elsif action == "2"
    puts "Tu attaques #{enemy2.name}:"
    human.attacks(enemy2)
    puts " "
    end

  
  enemies.each do |enemy|
    if enemy.hp > 0
      puts "Les ennemis t'attaquent !"
      enemy.attacks(human)
    end
  end
end

puts " "
puts "_______________________________"
puts "|                             |"
puts "|    t'es un.e champion.ne    |"
puts "|                             |"
puts "_______________________________"
puts " "
puts "Bien fait pour votre gueule José et Josiane"