require "console_chess/space"

module ConsoleChess
  class Bishop < Space

    def set_token
      @row == "8" ? @token = "b" : @token = "B"
    end

  end
end