

module ConsoleChess
  class Space

    attr_reader :token, :position, :call_sign, :available_moves, :move_count

    def initialize(column, row, color = "_")
      @column = column
      @row = row
      @color = color

      @token = "_"
      set_token
      @position = "#{@column}#{@row}"
      @call_sign = "#{@token}#{@position}"

      @available_moves = []
      @move_count = 0
    end

    def set_token
      @token = "_"
    end

    def available_move?(target, game_board)
      populate_available_moves(game_board)
      @available_moves.include?(target[1..-1])
    end

  end
end