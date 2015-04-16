require "console_chess/space"

module ConsoleChess
  class Pawn < Space

    def set_token; @row == "7" ? @token = "p" : @token = "P"; end

    def populate_available_moves
      @available_moves = []
      #move one space forward
      @available_moves << "#{@column}#{forward}"
      #capture one space forward and to either side if occupied
      @available_moves << "#{right.chr}#{forward}" if on_board?(right, forward) && capture?("#{right.chr}#{forward}")
      @available_moves << "#{left.chr}#{forward}" if on_board?(left, forward) && capture?("#{left.chr}#{forward}")

      unmoved if unmoved?
    end

    def unmoved
      #move forward two spaces if first move
      @available_moves << "#{@column}#{forward2}" if empty?("#{@column}#{forward}", "#{@column}#{forward2}")
        
      #en passant
      @available_moves << "#{right.chr}#{forward2}" if on_board?(right, forward2) && capture?("#{right.chr}#{forward2}")
      @available_moves << "#{left.chr}#{forward2}" if on_board?(left, forward2) && capture?("#{left.chr}#{forward2}")
    end

    def forward2; white? ? @row.to_i + 2 : @row.to_i - 2; end

    #add logic to allow promotion

  end
end