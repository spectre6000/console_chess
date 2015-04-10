module ConsoleChess
  class Session

    attr_reader :turn
  
    def initialize(printer = Printer.new, reader = Reader.new, board = Board.new(printer))
      @printer = printer
      @reader = reader
      @board = board
      # @round = 1
      @turn = "Black"
    end

    def play
      welcome
      loop do
        print_board
        get_move(take_turn)
        break if @board.winner?
        take_turn
      end
    end

    def welcome
      @printer.print("Welcome to ConsoleChess!")
    end

    def print_board
      @printer.print(@board.print_board)
    end

    def get_move(turn)
      print_turn
      loop do
        move = @reader.read
        if valid_move_format?(move)
          invalid_move
        # add elsif to verify if the move is legal for the specific piece in question
        else
          return move
        end
      end
    end

    def print_turn
      @printer.print("#{take_turn}'s turn:")
    end

    def valid_move_format?(move)
      move !~ /[PpRrNnBbQqKk][a-h]{1,2}[1-8]/
    end

    def take_turn
      @turn == "White" ? @turn = "Black" : @turn = "White"
    end

    def invalid_move
      @printer.print("Not a valid move")
    end

  end
end