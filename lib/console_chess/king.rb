require "console_chess/space"

module ConsoleChess
  class King < Space

    def set_token
      @row == "8" ? @token = "k" : @token = "K"
    end

    def populate_available_moves(game_board)
      @available_moves = []

      x = [ (@column.ord - 1) , @column.ord, (@column.ord + 1) ]
      y = [ @row.to_i + 1 , @row.to_i , @row.to_i - 1 ]
      
      x.each do |x|
        y.each do |y|
          if x > 96 && x < 105 && y > 0 && y < 9 && "#{x.chr}#{y}" != @position 
            if (@color == "White" && (space_verify(game_board, "#{x.chr}#{y}").token) =~ /[prnbqk_]/) || 
               (@color == "Black" && (space_verify(game_board, "#{x.chr}#{y}").token) =~ /[PRNBQK_]/)  
                @available_moves << "#{x.chr}#{y}"
            end
          end
        end
      end

      # castling
      if @move_count == 0
        if @color == "White"
          if space_verify(game_board, "a1").move_count == 0 &&
            space_verify(game_board, "b1").token == "_" &&
            space_verify(game_board, "c1").token == "_" &&
            space_verify(game_board, "d1").token == "_"
              @available_moves << "c1" 
          end
          if space_verify(game_board, "h1").move_count == 0 &&
            space_verify(game_board, "g1").token == "_" &&
            space_verify(game_board, "f1").token == "_"
              @available_moves << "g1"
          end
        end
        if @color == "Black"
          if space_verify(game_board, "a8").move_count == 0 &&
            space_verify(game_board, "b8").token == "_" &&
            space_verify(game_board, "c8").token == "_" &&
            space_verify(game_board, "d8").token == "_"
              @available_moves << "c8"
          end
          if space_verify(game_board, "h8").move_count == 0 &&
            space_verify(game_board, "g8").token == "_" &&
            space_verify(game_board, "f8").token == "_"
              @available_moves << "g8" 
          end
        end
      end

    end

  end
end