

module ConsoleChess
  class Space

    attr_reader :token, :position, :call_sign

    def initialize(column, row)
      @column = column
      @token = "_"
      @available_moves = []
      set_token
      set_column
      @row = row
      @position = "#{@column}#{@row}"
      @call_sign = "#{@token}#{@position}"      
    end


    def set_token(token = @token, color = @color)
      if @color == "Black"
        @token = @token.downcase
      elsif @color == "White"
        @token = @token.upcase
      end          
    end

    def set_row(color = @color, token = @token)
      if @color == "Black" && @token != "p"
        @row = "8"
      elsif @color == "Black" && @token == "p"
        @row = "7"
      elsif @color == "White" && @token != "P"
        @row = "1"
      elsif @color == "White" && @token == "P"
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

    def set_available_moves

    end

  end
end