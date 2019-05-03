class Player
    attr_accessor :name, :symbol

    def initialize(name,symbol)
        @name = name
        @symbol = symbol
    end

    def show_name
        name
    end
    def show_symbol
        symbol
    end


end