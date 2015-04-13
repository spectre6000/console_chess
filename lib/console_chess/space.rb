

module ConsoleChess
  class Space

    attr_reader :token, :position, :call_sign

    def initialize(column, row, color = "_")
      @column = column
      @row = row
      @color = color

      @token = "_"
      set_token
      @position = "#{@column}#{@row}"
      @call_sign = "#{@token}#{@position}"
      
      @available_moves = []
    end

    def set_token
      @token = "_"
    end

    # def set_available_moves

    # end

  end
end