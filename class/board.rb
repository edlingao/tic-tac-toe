class Board
   attr_accessor :board_position

    def initialize

        bord = Array.new(3){Array.new(3)}

        for i in 0 .. 2
            for j in 0 .. 2
                bord[i][j] = "#"
            end
        end
        @board_position = bord
    end

    private
 
    public
    def play_position(col, row, symbol)
        board_position[col][row] = symbol
    end
    def print_board
        board = "
            0   1   2\n
        0   #{board_position[0][0]} | #{board_position[0][1]} | #{board_position[0][2]}\n
        1   #{board_position[1][0]} | #{board_position[1][1]} | #{board_position[1][2]}\n
        2   #{board_position[2][0]} | #{board_position[2][1]} | #{board_position[2][2]}"
        
        return board
    end

    
end

