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

    def set_token; @token = "_"; end

    def unmoved?; true if @move_count == 0; end

    def white?; @color == "White" ? true : false; end

    def get_space(space); @game_board.find { |piece| piece.position == space}; end

    def available_move?(target)
      populate_available_moves
      @available_moves.include?(target[1..2])
    end

    def on_board?(position)
      position[0].ord > 96 && 
      position[0].ord < 105 && 
      position[1..-1].to_i > 0 && 
      position[1..-1].to_i < 9 && 
      position != @position 
    end

    def empty?(*positions); positions.all? { |position| get_space(position).token =~ /_/ }; end

    def capture?(position)
        (white? && (get_space(position).token) =~ /[prnbqk]/ ) || 
        (!white? && (get_space(position).token) =~ /[PRNBQK]/ )
    end

    def left(x); @column.ord - x; end

    def right(x); @column.ord + x; end

    def forward(x); white? ? @row.to_i + x : @row.to_i - x; end

    def backward(x); white? ? @row.to_i - x : @row.to_i + x; end

  end
end