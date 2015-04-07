require "console_chess/space"

module ConsoleChess
  class Queen < Space

    attr_reader :token, :position, :call_sign

    def initialize(column, color)
      @color = color
      @column = column
      @token = "q"
      set_token
      set_row
      @position = "#{@column}#{@row}"
      @call_sign = "#{@token}#{@position}"      
    end

  end
end