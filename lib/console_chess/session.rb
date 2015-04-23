module ConsoleChess
  class Session
  
    def initialize(printer = Printer.new, reader = Reader.new, board = Board.new)
      @printer = printer
      @reader = reader
      @board = board
      @turn = "White"
    end

    def play
      welcome
      loop do
        check?
        print_board
        move = get_move(@turn)
        @board.commit_move(move)
        break if @board.winner?
        take_turn
      end
    end

    def welcome; @printer.print("Welcome to ConsoleChess!"); end

    def print_board; @printer.print(@board.print_board); end

    def get_move(turn)
      print_turn
      move = @reader.read.chomp
      until valid_move?(move)
        invalid_move
        move = @reader.read.chomp
      end
      move
    end

    def print_turn; @printer.print("#{@turn}'s turn:"); end

    def valid_move?(move)
      start = move.split(" ")[0]
      target = move.split(" ")[2]
      
      if valid_entry?(move, start, target) && 
        correct_player?(start) &&
        @board.piece_in_place?(start) && 
        @board.piece_in_place?(target) && 
        @board.legal_move?(start, target)
        true
      else
        false
      end
    end

    def valid_entry?(move, start, target)
      if valid_start_call_sign?(start) && 
        valid_target_call_sign?(target) && 
        valid_format?(move, start, target)
        true
      else
        false
      end
    end

    def correct_player?(start)
      (@turn == "White" && start[0].upcase == start[0]) || (@turn == "Black" && start[0].downcase == start[0]) ? true : false
    end

    def valid_start_call_sign?(call_sign); call_sign =~ /[PpRrNnBbQqKk][a-h][1-8]/ ? true : false; end

    def valid_target_call_sign?(call_sign); call_sign =~ /[_PpRrNnBbQqKk][a-h][1-8]/ ? true : false; end

    def valid_format?(move, start, target); move == "#{start} to #{target}" ? true : false; end

    def invalid_move; @printer.print("Not a valid move"); end

    def take_turn; @turn == "White" ? @turn = "Black" : @turn = "White"; end

    def check; puts "Check!" if @board.check_for_check?; end

  end
end