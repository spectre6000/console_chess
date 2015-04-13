require "console_chess/space"

module ConsoleChess
  class Queen < Space

    def set_token
      @row == "8" ? @token = "q" : @token = "Q"
    end

  end
end 