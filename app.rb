require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")


puts "Voici l'état de nos joueurs :" #first step of the game showing each players' health
player1.show_state
player2.show_state
puts "____________"

puts "Passons à la phase d'attaque !" #second step where players are fighting, and losing health each turn
  while player1.hp > 0 && player2.hp > 0
    player1.show_state
    player2.show_state
    player1.attacks(player2)
    if player2.hp < 0 || player2.hp < 0
        break
    end
    player2.attacks(player1)
    puts "___________"
  end