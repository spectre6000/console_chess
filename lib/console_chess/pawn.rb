require "console_chess/space"

module ConsoleChess
  class Pawn < Space

    attr_reader :token, :position, :call_sign, :available_moves

    def initialize(column, color)
      @color = color
      @column = column
      @token = "p"
      set_token
      set_column
      set_row
      @position = "#{@column}#{@row}"
      @call_sign = "#{@token}#{@position}"
      @move_count = 0
    end

    def new_moves(game_board)   
      if not_blocked? # write blocked into Space
        # add row + 1 to moves
      elsif capture?
        # add row + 1, column ± 1 to moves
      elsif @move_count == 0
        # add row + 2 to moves
      elsif @move_count == 0 && capture?
        # add row + 2, column ± 1 to moves
      end
       # moves
    end

  end
end