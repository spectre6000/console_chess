require "console_chess/space"

module ConsoleChess
  class Rook < Space

    def set_token
      @row == "8" ? @token = "r" : @token = "R"
    end

  end
end 