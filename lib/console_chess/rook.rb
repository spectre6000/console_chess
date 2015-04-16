require "console_chess/space"

module ConsoleChess
  class Rook < Space

    def set_token; @row == "8" ? @token = "r" : @token = "R"; end

    def populate_available_moves
      @available_moves = []
      
      down
    end    

    def down(x = 1, moves = [])
      if capture?(moves[-1]) || !on_board() || empty?()
        moves
      elsif empty?()
        moves << "#{@column}#{backward(x)}"
        down( x + 1, moves )
      end
    end
  end
end 