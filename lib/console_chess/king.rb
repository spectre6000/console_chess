require "console_chess/space"

module ConsoleChess

  class King < Space

    attr_reader :token

    def initialize(color)
      @color = color
      @token = "k"
      set_token
    end

  end

end