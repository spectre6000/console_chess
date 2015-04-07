require "console_chess/space"

module ConsoleChess

  class Bishop < Space

    attr_reader :token

    def initialize(color)
      @color = color
      @token = "b"
      set_token
    end

  end
  
end