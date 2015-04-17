require "console_chess/space"

module ConsoleChess
  class Queen < Space

    def set_token
      @row == "8" ? @token = "q" : @token = "Q"
    end

    def populate_available_moves
      @available_moves = []

      directions = [move_ul, move_dl, move_ur, move_dr, move_backward, move_forward, move_left, move_right]

      directions.each {|x| @available_moves.concat(linear_movement(&x))}
    end

  end
end 