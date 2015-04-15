require "console_chess/space"

module ConsoleChess
  class Pawn < Space

    def set_token
      @row == "7" ? @token = "p" : @token = "P"
    end

    def populate_available_moves
      @available_moves = []
      #move one space forward
      white? ? @available_moves << "#{@column}#{@row.to_i + 1}" : @available_moves << "#{@column}#{@row.to_i - 1}"
      #move forward two spaces if first move
      if white? && unmoved? && empty?("#{@column}#{@row.to_i + 1}", "#{@column}#{@row.to_i + 2}")
        @available_moves << "#{@column}#{@row.to_i + 2}"
      elsif unmoved? && empty?("#{@column}#{@row.to_i - 1}", "#{@column}#{@row.to_i - 2}")
        @available_moves << "#{@column}#{@row.to_i - 2}"
      end
      #capture one space forward and to either side if occupied
      if white?
        @available_moves << "#{(@column.ord + 1).chr}#{@row.to_i + 1}" if (@column.ord + 1) < 105 && capture?("#{(@column.ord + 1).chr}#{@row.to_i + 1}")
        @available_moves << "#{(@column.ord - 1).chr}#{@row.to_i + 1}" if (@column.ord - 1) > 96 && capture?("#{(@column.ord - 1).chr}#{@row.to_i + 1}")
      else
        @available_moves << "#{(@column.ord + 1).chr}#{@row.to_i - 1}" if (@column.ord + 1) < 105 && capture?("#{(@column.ord + 1).chr}#{@row.to_i - 1}")
        @available_moves << "#{(@column.ord - 1).chr}#{@row.to_i - 1}" if (@column.ord - 1) > 96 && capture?("#{(@column.ord - 1).chr}#{@row.to_i - 1}")
      end
      #en passant
      if white? && unmoved?
        @available_moves << "#{(@column.ord + 1).chr}#{@row.to_i + 2}" if (@column.ord + 1) < 105 && capture?("#{(@column.ord + 1).chr}#{@row.to_i + 2}")
        @available_moves << "#{(@column.ord - 1).chr}#{@row.to_i + 2}" if (@column.ord - 1) > 96 && capture?("#{(@column.ord - 1).chr}#{@row.to_i + 2}")
      elsif unmoved?
        @available_moves << "#{(@column.ord + 1).chr}#{@row.to_i - 2}" if (@column.ord + 1) < 105 && capture?("#{(@column.ord + 1).chr}#{@row.to_i - 2}")
        @available_moves << "#{(@column.ord - 1).chr}#{@row.to_i - 2}" if (@column.ord - 1) > 96 && capture?("#{(@column.ord - 1).chr}#{@row.to_i - 2}")
      end
    end

    #add logic to allow promotion

  end
end