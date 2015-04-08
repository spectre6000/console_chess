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
        @printer.print("#{@turn}'s turn:")
        move = @reader.read
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

  end
end