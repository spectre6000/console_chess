require "console_chess/space"

module ConsoleChess
  class King < Space

    def set_token
      @row == "8" ? @token = "k" : @token = "K"
    end

    def populate_available_moves(game_board)
      x = [ @row.to_i + 1 , @row.to_i , @row.to_i - 1 ]
      y = [ (@column.ord - 1) , @column.ord, (@column.ord + 1) ]
      
      x.each do |x|
        y.each do |y|
          @available_moves << "#{y.chr}#{x}" if x > 0 && x < 9 && y > 96 && y < 105 && "#{y.chr}#{x}" != @position
        end
      end

      # castling
      if @move_count == 0
        if @color == "White"
          if (game_board.find{|piece| piece.position == "a1"}).move_count == 0
            @available_moves << "c1"
          end
          if (game_board.find{|piece| piece.position == "h1"}).move_count == 0
            @available_moves << "g1"
          end
        end
        if @color == "Black"
          if (game_board.find{|piece| piece.position == "a8"}).move_count == 0
            @available_moves << "c8"
          end
          if (game_board.find{|piece| piece.position == "h8"}).move_count == 0
            @available_moves << "g8"
          end
        end
      end
    end

  end
end