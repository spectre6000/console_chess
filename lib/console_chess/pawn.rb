require "console_chess/space"

module ConsoleChess
  class Pawn < Space

    def set_token
      @row == "7" ? @token = "p" : @token = "P"
    end

    def populate_available_moves(game_board)
      #move one space forward
      @color == "White" ? @available_moves << "#{@column}#{@row.to_i + 1}" : @available_moves << "#{@column}#{@row.to_i - 1}"
      #move forward two spaces if first move
      if @move_count == 0
        @color == "White" ? @available_moves << "#{@column}#{@row.to_i + 2}" : @available_moves << "#{@column}#{@row.to_i - 2}"
      end
      #capture one space forward and to either side if occupied
      if capture == true
        if @color == "White"
          @available_moves << "#{(@column.ord + 1).chr}#{@row.to_i + 1}" if (@column.ord + 1) < 105
          @available_moves << "#{(@column.ord - 1).chr}#{@row.to_i + 1}" if (@column.ord - 1) > 96
        else
          @available_moves << "#{(@column.ord + 1).chr}#{@row.to_i - 1}" if (@column.ord + 1) < 105
          @available_moves << "#{(@column.ord - 1).chr}#{@row.to_i - 1}" if (@column.ord - 1) > 96
        end
      end
      #en passant
      if @move_count == 0 && capture == true
        if @color == "White"
          @available_moves << "#{(@column.ord + 1).chr}#{@row.to_i + 2}" if (@column.ord + 1) < 105
          @available_moves << "#{(@column.ord - 1).chr}#{@row.to_i + 2}" if (@column.ord - 1) > 96
        else
          @available_moves << "#{(@column.ord + 1).chr}#{@row.to_i - 2}" if (@column.ord + 1) < 105
          @available_moves << "#{(@column.ord - 1).chr}#{@row.to_i - 2}" if (@column.ord - 1) > 96
        end
      end
    end

  end
end