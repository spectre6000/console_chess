require "console_chess/space"

module ConsoleChess
  class Pawn < Space

    def set_token
      @row == "7" ? @token = "p" : @token = "P"
    end

    def populate_available_moves
      @available_moves = []
      left = @column.ord - 1
      right = @column.ord + 1
      forward1 = (white? ? @row.to_i + 1 : @row.to_i - 1)
      #move one space forward
      @available_moves << "#{@column}#{forward1}"
      #capture one space forward and to either side if occupied
      @available_moves << "#{right.chr}#{forward1}" if on_board?(right, forward1) && capture?("#{right.chr}#{forward1}")
      @available_moves << "#{left.chr}#{forward1}" if on_board?(left, forward1) && capture?("#{left.chr}#{forward1}")

      unmoved if unmoved?
    end

    def unmoved
      left = @column.ord - 1
      right = @column.ord + 1
      forward1 = (white? ? @row.to_i + 1 : @row.to_i - 1)
      forward2 = (white? ? @row.to_i + 2 : @row.to_i - 2)
      #move forward two spaces if first move
      @available_moves << "#{@column}#{forward2}" if empty?("#{@column}#{forward1}", "#{@column}#{forward2}")
        
      #en passant
      @available_moves << "#{right.chr}#{forward2}" if on_board?(right, forward2) && capture?("#{right.chr}#{forward2}")
      @available_moves << "#{left.chr}#{forward2}" if on_board?(left, forward2) && capture?("#{left.chr}#{forward2}")
    end

    #add logic to allow promotion

  end
end