require "console_chess/space"

module ConsoleChess
  class King < Space

    attr_reader :token, :position

    def initialize(column, color)
      @color = color
      @column = column      
      @token = "k"
      set_token
      set_row
      @position = "#{@column}#{@row}"
    end

  end
end