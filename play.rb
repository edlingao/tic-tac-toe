#board.rb
require_relative 'class/board'
#player.rb
require_relative 'class/player'
#game.rb
require_relative 'class/game'
#menu_module.rb
require_relative 'class/menu_module'
include Menu
def play(win,players,g,board)
    i = 0
    cats_game = false
    while(!win)
        system("clear")
        puts board.print_board();
        puts "Its #{players[i].name} turn"
        print "Input the column you want to play: "
        col = gets.chomp
        print "Input the row you want to play: "
        row = gets.chomp
        prbr = g.turn(players[i], row.to_i, col.to_i)
        case prbr
            when "Is not possible to play on that coordenate" then 
                puts "Is not possible to play on that coordenate"
                cats_game = g.cats_game?
                sleep(1)
            else
                puts prbr    
                win = g.win?
                cats_game = g.cats_game?
                puts "Player: #{players[i].name} has win!!" if win
                i = i >= 1 ? 0 : 1
        end
        
        if cats_game && !win
            win = true
            puts "Cat's game!!\nNone players win!"
            sleep(5)
        end
    
    end
    j = 10
    for i in 1 .. 10
        system("clear")
        puts board.print_board
        puts "Returning to menu on #{j}... seconds"
        j -= 1
        sleep(1)
    end
end




exbo = Board.new()

playing = true
option = 0

i = 0
has_win = false



while(playing) do
    choose = option
    system("clear")
    puts move_on_menu(option)
    part = gets.chomp
    option += select_from_menu(part)
    option = 0 if option == 3 || option <= 0


    if option >= 10
        case choose
            when 0 then 
                option = 0
                system("clear")
                print "Set a name for the player 1: "
                name1 = gets.chomp
                print "Set a symbol to play for player 1: "
                symbol1 = gets.chomp
                system("clear")
                print "Set a name for the player 2: "
                name2 = gets.chomp
                print "Set a symbol to play for player 2: "
                symbol2 = gets.chomp

                p1 = Player.new(name1,symbol1)
                p2 = Player.new(name2,symbol2)
                players = [p1,p2]
                board = Board.new()
                g = Game.new(board,p1,p2)
                play(has_win,players,g,board)

            when 1 then 
                j = 10
                for i in 1 .. 10
                    system("clear")
                    puts instructions(exbo);
                    puts "Returning to menu on #{j}... seconds"
                    j -= 1
                    sleep(1)
                    
                end
                option = 0
                
            when 2 then 
                playing = false
                puts "Exiting..."
                
        end
    end
    
    
end




