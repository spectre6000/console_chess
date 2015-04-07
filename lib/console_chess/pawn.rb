require "console_chess/space"

module ConsoleChess
  class Pawn < Space

    attr_reader :token, :position

    def initialize(color, column)
      @color = color
      @column = column
      @token = "p"
      set_column
      set_token
      set_row
      @position = "#{@column}#{@row}"
    end

  end
end