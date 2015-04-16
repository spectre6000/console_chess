require "console_chess/space"

module ConsoleChess
  class Rook < Space

    def set_token; @row == "8" ? @token = "r" : @token = "R"; end

    def populate_available_moves
      @available_moves = []
      
      @available_moves.concat(mdown)
      @available_moves.concat(mup)
      @available_moves.concat(mleft)
      @available_moves.concat(mright)
    end    

    def mdown (x = 1, moves = [])
      move = "#{ @column }#{ backward(x) }"
      if on_board?(move) && (capture?(move) || empty?(move)) && (moves[-1] == nil || !capture?(moves[-1]))
        moves << move
        mdown( x + 1, moves )
      else
        moves
      end
    end

    def mup (x = 1, moves = [])
      move = "#{ @column }#{ forward(x) }"
      if on_board?(move) && (capture?(move) || empty?(move)) && (moves[-1] == nil || !capture?(moves[-1]))
        moves << move
        mup( x + 1, moves )
      else
        moves
      end
    end

    def mleft (x = 1, moves = [])
      move = "#{ left(x).chr }#{ @row }"
      if on_board?(move) && (capture?(move) || empty?(move)) && (moves[-1] == nil || !capture?(moves[-1]))
        moves << move
        mleft( x + 1, moves )
      else
        moves
      end
    end  

    def mright (x = 1, moves = [])
      move = "#{ right(x).chr }#{ @row }"
      if on_board?(move) && (capture?(move) || empty?(move)) && (moves[-1] == nil || !capture?(moves[-1]))
        moves << move
        mright( x + 1, moves )
      else
        moves
      end
    end  

  end
end 