require "console_chess/space"

module ConsoleChess
  class Knight < Space

    attr_reader :token, :position

    def initialize(column, color)
      @color = color
      @column = column
      @token = "n"
      set_token
      set_row
      @position = "#{@column}#{@row}"
    end

  end
end