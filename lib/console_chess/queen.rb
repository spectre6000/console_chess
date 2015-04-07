require "console_chess/space"

module ConsoleChess
  class Queen < Space

    attr_reader :token, :position

    def initialize(column, color)
      @color = color
      @column = column
      @token = "q"
      set_token
      set_row
      @position = "#{@column}#{@row}"
    end

  end
end