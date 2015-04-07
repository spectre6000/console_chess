module ConsoleChess
  class Session
    def initialize(printer = Printer.new, reader = Reader.new, board = Board.new(printer))
      @printer = printer
      @reader = reader
      @board = board
    end

    def play
      @printer.print("Welcome to ConsoleChess!")
      while @board.continue?
        # print the board
        @board.print_board
        # prompt user for move
        @printer.print("White's move:")
        # board.move("pc1")
        # check board for winner, change continue if so
      end
    # printer.print "Game over!"
    end
  end
end