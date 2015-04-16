require "console_chess/space"

module ConsoleChess
  class Pawn < Space

    def set_token; @row == "7" ? @token = "p" : @token = "P"; end

    def populate_available_moves
      @available_moves = []
      #move one space forward
      @available_moves << "#{@column}#{forward(1)}"
      #capture one space forward and to either side if occupied
      @available_moves << "#{right(1).chr}#{forward(1)}" if on_board?(right(1), forward(1)) && capture?("#{right(1).chr}#{forward(1)}")
      @available_moves << "#{left(1).chr}#{forward(1)}" if on_board?(left(1), forward(1)) && capture?("#{left(1).chr}#{forward(1)}")

      unmoved if unmoved?
    end

    def unmoved
      #move forward two spaces if first move
      @available_moves << "#{@column}#{forward(2)}" if empty?("#{@column}#{forward(2)}", "#{@column}#{forward(2)}")
        
      #en passant
      @available_moves << "#{right(1).chr}#{forward(2)}" if on_board?(right(1), forward(2)) && capture?("#{right(1).chr}#{forward(2)}")
      @available_moves << "#{left(1).chr}#{forward(2)}" if on_board?(left(1), forward(2)) && capture?("#{left(1).chr}#{forward(2)}")
    end


    #add logic to allow promotion

  end
end