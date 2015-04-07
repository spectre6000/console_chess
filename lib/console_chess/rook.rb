require "console_chess/space"

module ConsoleChess

  class Rook < Space

    attr_reader :token

    def initialize(color)
      @color = color
      @token = "r"
      set_token
    end

  end

end