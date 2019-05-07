require 'colorize'
module Menu
    def select_from_menu(option)
        super_option = option.to_s
    
        if super_option == "\e[A"
            return -1
        elsif super_option == "\e[B"
            return 1
        elsif super_option == "s" || super_option == "" || super_option == "S"
    
            return 10
        else
            return 0
        end
    end

    def move_on_menu(option)

        menu_options = ["Play", "Basic instructions", "Exit"]
        display = "To move through options please press up/down key and then press enter\nTo choose an option just press enter or input 'S' or 's' and then press enter key\n\n\t\t--- Menu ---\n"
        menu_options.each_with_index{|value, i|
            if i == option then display += "->#{menu_options[option].colorize(:background => :light_black)}\n"
            else display += "#{value}\n"
            end
        }

        return display
    end

    private
    def instructions(bor)
        bor.play_position(0,0,"X")
        bor.play_position(1,1,"X")
        bor.play_position(2,2,"X")

        exmpl = bor.print_board
        message = "First player is always the first one to play\nYou win when you fill 3 consecutive cells of your symbol ex.\n#{exmpl}\nRemember to always have fun an never get mad\nStart by choosing 'Pay' on menu"

    end
end