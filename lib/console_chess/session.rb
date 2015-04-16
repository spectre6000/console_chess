module ConsoleChess
  class Session
  
    def initialize(printer = Printer.new, reader = Reader.new, board = Board.new)
      @printer = printer
      @reader = reader
      @board = board
      @turn = "Black"
    end

    def play
      welcome
      loop do
        print_board
        get_move(take_turn)
        # add logit to commit move; must pass game board to piece to generate new available moves array
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
      move = @reader.read
      until valid_move?(move)
        invalid_move
        move = @reader.read
      end
      move
    end

    def print_turn
      @printer.print("#{take_turn}'s turn:")
    end

    def valid_move?(move)
      start = move.split(" ")[0]
      target = move.split(" ")[2]

      if valid_format?(start, target, move) && 
        @board.piece_in_place?(start) && 
        @board.piece_in_place?(target) && 
        @board.legal_move?(start, target)
        true
      else
        false
      end
    end

    def valid_format?(start, target, move)
      valid_start_call_sign?(start) && 
      valid_target_call_sign?(target) && 
      "#{start} to #{target}" == move ? true : false
    end

    def valid_start_call_sign?(call_sign)
      call_sign =~ /[PpRrNnBbQqKk][a-h][1-8]/
    end

    def valid_target_call_sign?(call_sign)
      call_sign =~ /[_PpRrNnBbQqKk][a-h][1-8]/
    end

    def invalid_move
      @printer.print("Not a valid move")
    end

    def take_turn
      @turn == "White" ? @turn = "Black" : @turn = "White"
    end
  end
end