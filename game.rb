   
class Game
    attr_accessor :board, :player1, :player2, :space
    def initialize(fboard, player1, player2)
        @board = fboard
        @player1 = player1
        @player2 = player2
        @space = 0
    end

    def cats_game?
        b = board.board_position
        space = 0
        b.each_with_index{|value,i|
            value.each_with_index{|cat, j|
                space += 1 if b[i][j] != "#" 
            }
        }
        return true if space == 9
        return false if space < 9
    end
    def win?
        b = board.board_position
        b.each_with_index{|value, i|
            value.each_with_index{|pos,j|
                
                return true if b[i][j+ 1] != "#" &&  b[i][j + 1] == b[i][j] && b[i][j + 1] == b[i][j + 2] 
                if i <= 0
                    return true if b[i + 1][j] != "#" &&  b[i + 1][j] == b[i][j] && b[i + 1][j] == b[i + 2][j] 
                    if b[i + 1][j + 1] != "#" && j == 0 && i == 0
                        return true if b[i + 1][j + 1] == b[i][j] && b[i + 1][j + 1] == b[i + 2][j + 2] 
                        return true if b[i + 1][j + 1] == b[i][j + 2] && b[i + 1][j + 1] == b[i + 2][j] 
                    end
                end
                
                
            }
            
        }

        return false
    end

    def turn(player, col, row)
        
        if is_playable?(board, col, row)
            board.play_position(col,row,player.symbol)     
            return board.print_board()
        else
            return "Is not possible to play on that coordenate"
        end

    end

    private
    def is_playable?(board, col, row)
        if board.board_position[col][row] != "#"
            return false
        else
            return true
        end
        
    end


    
end
