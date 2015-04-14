require "console_chess/space"

module ConsoleChess
  class King < Space

    def set_token
      @row == "8" ? @token = "k" : @token = "K"
    end

    def populate_available_moves(capture)
      x = [ @row.to_i + 1 , @row.to_i , @row.to_i - 1 ]
      y = [ (@column.ord - 1) , @column.ord, (@column.ord + 1) ]
      
      x.each do |x|
        y.each do |y|
          @available_moves << "#{y.chr}#{x}" if x > 0 && x < 9 && y > 96 && y < 105 && "#{y.chr}#{x}" != @position
        end
      end

      # castling
      if @move_count == 0
      end
    end

  end
end