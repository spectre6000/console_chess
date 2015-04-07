require "console_chess/space"

module ConsoleChess
  
  class Knight < Space

    attr_reader :token

    def initialize(color)
      @color = color
      @token = "n"
      set_token
    end

  end

end