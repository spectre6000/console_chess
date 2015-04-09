module ConsoleChess
  class Session

    attr_reader :turn
  
    def initialize(printer = Printer.new, reader = Reader.new, board = Board.new(printer))
      @printer = printer
      @reader = reader
      @board = board
      @turn = "White"
    end

    def play
      @printer.print("Welcome to ConsoleChess!")
      loop do
        get_move(@turn)
        if @board.winner == true
          break
        end
        take_turn
      end
    end

    def take_turn
      new_turn = ["Black", "White"]
      new_turn.delete(@turn)
      @turn = new_turn[0]
    end

    def get_move(turn)
      @printer.print("#{@turn}'s turn:")
      loop do
        move = @reader.read
        if move !~ /[PpRrNnBbQqKk][a-h]{1,2}[1-8]/
          @printer.print("Not a valid move")
        else
          break
        end
      end
    end

  end
end