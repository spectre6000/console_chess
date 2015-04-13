

module ConsoleChess
  class Space

    attr_reader :token, :position, :call_sign

    def initialize(column, row)
      @column = column
      @token = "_"
      @available_moves = []
      set_token
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

    def set_available_moves

    end

  end
end