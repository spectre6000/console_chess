require "console_chess/space"

module ConsoleChess

  class King < Space

    attr_reader :token, :position

    def initialize(color, column)
      @color = color
      @token = "k"
      set_token
      @column = column
      @row
      set_row
      @position = "#{@column}#{@row}"
    end

  end
end