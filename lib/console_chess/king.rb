require "console_chess/space"

module ConsoleChess
  class King < Space

    def set_token; @row == "8" ? @token = "k" : @token = "K"; end

    def populate_available_moves
      @available_moves = []

      x = [ left(1) , @column.ord, right(1) ]
      y = [ forward(1) , @row.to_i , backward(1) ]
      
      x.each do |x|
        y.each do |y|
          move = "#{x.chr}#{y}"
          @available_moves << move if on_board?(move) && (capture?(move) || empty?(move))
        end
      end

      castle if unmoved?
    end

    def castle
      if white?
        @available_moves << "c1C" if get_space("a1").unmoved? && empty?("b1", "c1", "d1")
        @available_moves << "g1C" if get_space("h1").unmoved? && empty?("g1", "f1")
      else
        @available_moves << "c8C" if get_space("a8").unmoved? && empty?("b8", "c8", "d8")
        @available_moves << "g8C" if get_space("h8").unmoved? && empty?("g8", "f8")
      end
    end

    #add logic that prevents moving into check

    #add logic that commits castle and communicates to/moves rook

  end
end