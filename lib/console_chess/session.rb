module ConsoleChess
  class Session
  
    def initialize(printer = Printer.new, reader = Reader.new, board = Board.new(printer))
      @printer = printer
      @reader = reader
      @board = board
    end

  
    def play
      @printer.print("Welcome to ConsoleChess!")
      loop do
        @printer.print("#{@board.turn}'s turn:")
        if @board.winner == true
          break
        end
        @board.take_turn
      end
    end

  end
end