require "console_chess/space"

module ConsoleChess
  class King < Space

    def set_token
      @row == "8" ? @token = "k" : @token = "K"
    end

    def legal_move?(target)
      # if @token == "k"
    end

  end
end