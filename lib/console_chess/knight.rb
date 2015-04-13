require "console_chess/space"

module ConsoleChess
  class Knight < Space

    def set_token
      @row == "8" ? @token = "n" : @token = "N"
    end

  end 
end