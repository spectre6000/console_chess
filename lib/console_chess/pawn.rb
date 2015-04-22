require "console_chess/space"

module ConsoleChess
  class Pawn < Space

    def set_token; @row == "7" ? @token = "p" : @token = "P"; end

    def populate_available_moves
      @available_moves = []
      #move one space forward
      up1 = "#{@column}#{forward(1)}"
      @available_moves << up1
      #capture one space forward and to either side if occupied
      normal_capture_l = "#{left(1).chr}#{forward(1)}"
      normal_capture_r = "#{right(1).chr}#{forward(1)}"
      @available_moves << normal_capture_l if on_board?(normal_capture_l) && capture?(normal_capture_l)
      @available_moves << normal_capture_r if on_board?(normal_capture_r) && capture?(normal_capture_r)

      unmoved if unmoved?
    end

    def unmoved
      up1 = "#{@column}#{forward(1)}"
      #move forward two spaces if first move
      start_up2 = "#{@column}#{forward(2)}"
      @available_moves << start_up2 if empty?(up1, start_up2)
      #en passant
      en_passant_l = "#{left(1).chr}#{forward(2)}"
      en_passant_r = "#{right(1).chr}#{forward(2)}"
      @available_moves << en_passant_l if on_board?(en_passant_l) && empty?(up1) && capture?("#{left(1).chr}#{forward(1)}")
      @available_moves << en_passant_r if on_board?(en_passant_r) && empty?(up1) && capture?("#{right(1).chr}#{forward(1)}")
    end


    #add logic to allow promotion

  end
end