require "console_chess/space"

module ConsoleChess
  class Pawn < Space

    attr_reader :token, :position

    def initialize(column, color)
      @color = color
      @column = column
      @token = "p"
      set_token
      set_column
      set_row
      @position = "#{@column}#{@row}"
    end

  end
end