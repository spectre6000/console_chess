require "console_chess/space"

module ConsoleChess
  class King < Space

    def set_token
      @row == "8" ? @token = "k" : @token = "K"
    end

    def populate_available_moves
      @available_moves = []

      x = [ (@column.ord - 1) , @column.ord, (@column.ord + 1) ]
      y = [ @row.to_i + 1 , @row.to_i , @row.to_i - 1 ]
      
      x.each do |x|
        y.each do |y|
          @available_moves << "#{x.chr}#{y}" if on_board?(x, y) && 
          (capture?("#{x.chr}#{y}") || empty?("#{x.chr}#{y}"))
        end
      end

      castle if unmoved?
    end

    def castle
      if white?
        @available_moves << "c1" if get_space("a1").unmoved? && empty?("b1", "c1", "d1")
        @available_moves << "g1" if get_space("h1").unmoved? && empty?("g1", "f1")
      else
        @available_moves << "c8" if get_space("a8").unmoved? && empty?("b8", "c8", "d8")
        @available_moves << "g8" if get_space("h8").unmoved? && empty?("g8", "f8")
      end
    end

    #add logic that prevents moving into check

  end
end