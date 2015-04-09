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
        @board.print_board
        get_move(@turn)
        break if @board.winner == true
        take_turn
      end
    end

    def take_turn
      @turn = ["Black", "White"].keep_if{|x| x != @turn}[0]
    end

    def get_move(turn)
      @printer.print("#{@turn}'s turn:")
      loop do
        move = @reader.read
        if move !~ /[PpRrNnBbQqKk][a-h]{1,2}[1-8]/
          @printer.print("Not a valid move")
        # add elsif to verify if the move is legal for the specific piece in question
        else
          return move
        end
      end
    end

  end
end