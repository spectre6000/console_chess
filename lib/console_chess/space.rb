module ConsoleChess
  class Space

    attr_reader :token, :position

    def initialize(row, column, color = "empty")
      @color = color
      @column = column
      @token = "_"
      set_token
      set_column
      @row = row
      @position = "#{@row}#{@column}"
    end


    def set_token(token = @token, color = @color)
      if @color == "black"
        @token = @token.downcase
      elsif @color == "white"
        @token = @token.upcase
      end          
    end

    def set_row(color = @color, token = @token)
      if @color == "black" && @token != "p"
        @row = "8"
      elsif @color == "black" && @token == "p"
        @row = "7"
      elsif @color == "white" && @token != "P"
        @row = "1"
      elsif @color == "white" && @token == "P"
        @row = "2"
      end          
    end

    def set_column
      case @column
      when 1
        @column = "a"
      when 2
        @column = "b"
      when 3
        @column = "c"
      when 4
        @column = "d"
      when 5
        @column = "e"
      when 6
        @column = "f"
      when 7
        @column = "g"
      when 8
        @column = "h"
      end
    end

  end
end