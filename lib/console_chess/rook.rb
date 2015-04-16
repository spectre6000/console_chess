require "console_chess/space"

module ConsoleChess
  class Rook < Space

    def set_token; @row == "8" ? @token = "r" : @token = "R"; end

  def populate_available_moves(moves = [])
    @available_moves = []

    if capture?(last_space) || !on_board?(next_space) || friendly_fire(next_space)
      @available_moves << moves
    else

    end
  end    

  end
end 