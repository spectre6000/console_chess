

module ConsoleChess
  class Space

    attr_reader :token, :position, :call_sign, :available_moves, :move_count

    def initialize(column, row, color, board)
      @column = column
      @row = row
      @color = color
      @game_board = board.game_board

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

    def unmoved?
      true if @move_count == 0
    end

    def white?
      @color == "White" ? true : false
    end

    def get_space(space)
      @game_board.find { |piece| piece.position == space}
    end

    def available_move?(target)
      populate_available_moves
      @available_moves.include?(target[1..2])
    end

    def on_board?(column, row)
      column > 96 && 
      column < 105 && 
      row > 0 && 
      row < 9 && 
      "#{column.chr}#{row}" != @position 
    end

    def empty?(*positions)
      positions.all? { |position| get_space(position).token =~ /_/ }
    end

    def capture?(position)
      (white? && (get_space(position).token) =~ /[prnbqk]/ ) || 
      (!white? && (get_space(position).token) =~ /[PRNBQK]/ )
    end

  end
end