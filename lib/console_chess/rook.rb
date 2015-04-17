require "console_chess/space"

module ConsoleChess
  class Rook < Space

    def set_token; @row == "8" ? @token = "r" : @token = "R"; end

    def populate_available_moves
      @available_moves = []

      directions = [move_backward, move_forward, move_left, move_right]

      directions.each {|x| @available_moves.concat(linear_movement(&x))}
    end

  end
end 