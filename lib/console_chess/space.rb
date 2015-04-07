module ConsoleChess
  class Space

    attr_reader :token

    def initialize(color = "empty")
      @color = color
      @token = "_"
      set_token
    end

    def set_token(token = @token, color = @color)
      if @color == "black"
        @token = @token.downcase
      elsif @color == "white"
        @token = @token.upcase
      elsif @color == "empty"
        @token = @token
      end          
    end

  end
end