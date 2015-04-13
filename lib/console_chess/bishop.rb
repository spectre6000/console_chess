require "console_chess/space"

module ConsoleChess
  class Bishop < Space

    attr_reader :token, :position, :call_sign

    def initialize(column, color)
      @color = color
      @column = column
      @token = "b"
      @available_moves = []
      set_token
      set_row
      @position = "#{@column}#{@row}"
      @call_sign = "#{@token}#{@position}"
    end

  end
end