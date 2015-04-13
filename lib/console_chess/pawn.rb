require "console_chess/space"

module ConsoleChess
  class Pawn < Space

    def set_token
      @row == "7" ? @token = "p" : @token = "P"
    end

    @move_count = 0

    # def new_moves(game_board)   
    #   if not_blocked? # write blocked into Space
    #     # add row + 1 to moves
    #   elsif capture?
    #     # add row + 1, column ± 1 to moves
    #   elsif @move_count == 0
    #     # add row + 2 to moves
    #   elsif @move_count == 0 && capture?
    #     # add row + 2, column ± 1 to moves
    #   end
    #    # moves
    # end

  end
end