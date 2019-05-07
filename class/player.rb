class Player
    attr_accessor :name, :symbol

    def initialize(name,symbol)
        @name = name
        @symbol = symbol
    end

    private
    def has_win?(he_wins = false)
        return true if he_wins
        return false
    end


end