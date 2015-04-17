require "console_chess/space"

module ConsoleChess
  class Bishop < Space

    def set_token
      @row == "8" ? @token = "b" : @token = "B"
    end

    def populate_available_moves
      @available_moves = []

      directions = [move_ul, move_dl, move_ur, move_dr]

      directions.each {|x| @available_moves.concat(linear_movement(&x))}
    end

  end
end