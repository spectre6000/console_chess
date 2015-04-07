require "console_chess/space"

module ConsoleChess

  class Queen < Space

    attr_reader :token

    def initialize(color)
      @color = color
      @token = "q"
      set_token
    end

  end

end