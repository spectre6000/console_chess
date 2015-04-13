require "console_chess/space"

module ConsoleChess
  class King < Space

    attr_reader :token, :position, :call_sign

    def initialize(column, color, row = "")
      @color = color
      @column = column
      @row = row
      @available_moves = []
      @token = "k"
      set_token
      set_row
      set_available_moves
      @position = "#{@column}#{@row}"
      @call_sign = "#{@token}#{@position}"
    end

  end
end