require "console_chess/space"

module ConsoleChess
  class King < Space

    def set_token
      @row == "8" ? @token = "k" : @token = "K"
    end

    def legal_move?(target)
      populate_available_moves
      @available_moves.contains?(target)
    end

    def populate_available_moves
      @available_moves << "#{(@column.ord - 1).chr}#{@row.to_i + 1}" if @column.ord - 1 > 96 && @row.to_i + 1 < 9
      @available_moves << "#{(@column.ord + 0).chr}#{@row.to_i + 1}" if @row.to_i + 1 < 9
      @available_moves << "#{(@column.ord + 1).chr}#{@row.to_i + 1}" if @column.ord + 1 < 105 && @row.to_i + 1 < 9
      @available_moves << "#{(@column.ord - 1).chr}#{@row.to_i + 0}" if @column.ord - 1 > 96
      @available_moves << "#{(@column.ord + 1).chr}#{@row.to_i + 0}" if @column.ord + 1 < 105
      @available_moves << "#{(@column.ord - 1).chr}#{@row.to_i - 1}" if @column.ord - 1 > 96 && @row.to_i - 1 > 0
      @available_moves << "#{(@column.ord + 0).chr}#{@row.to_i - 1}" if @row.to_i - 1 > 0
      @available_moves << "#{(@column.ord + 1).chr}#{@row.to_i - 1}" if @column.ord + 1 < 105 && @row.to_i - 1 > 0
    end

  end
end