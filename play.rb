#board.rb
require_relative 'board'
#player.rb
require_relative 'player'
#game.rb
require_relative 'game'

player1 = Player.new("Edwin","X")
player2 = Player.new("Juan", "O")

bo= Board.new()
exbo = Board.new()
game = Game.new(bo)
idk = true
option = 0
while(idk) do
    choose = option
    system("clear")
    puts game.move_on_menu(option)
    part = gets.chomp
    option += game.select_from_menu(part)
    option = 0 if option == 3 || option == 0
    
    
end




