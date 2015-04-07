require "console_chess/space"

module ConsoleChess
  class Bishop < Space

    attr_reader :token, :position

    def initialize(column, color)
      @color = color
      @column = column
      @token = "b"
      set_token
      set_row
      @position = "#{@column}#{@row}"
    end

  end
end