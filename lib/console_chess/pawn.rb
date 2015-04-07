require "console_chess/space"

module ConsoleChess

  class Pawn < Space

    attr_reader :token

    def initialize(color)
      @color = color
      @token = "p"
      set_token
    end

  end

end