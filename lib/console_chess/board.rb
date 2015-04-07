module ConsoleChess
  class Board
    def initialize(printer)
      @printer = printer
      new_board
      @game_board
    end

    def continue(state=true)
      state
    end

    def print_board
      @game_board.all do |x| 
        @printer.print( x.token ) 
      end
    end

    def new_board
      primary_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

      row_8 = primary_pieces.map { |piece| piece.new("black")}
      row_7 = (1..8).map { |pawn| ConsoleChess::Pawn.new("black")}
      row_6 = (1..8).map { |space| ConsoleChess::Space.new}
      row_5 = (1..8).map { |space| ConsoleChess::Space.new}
      row_4 = (1..8).map { |space| ConsoleChess::Space.new}
      row_3 = (1..8).map { |space| ConsoleChess::Space.new}
      row_2 = (1..8).map { |pawn| ConsoleChess::Pawn.new("white")}
      row_1 = primary_pieces.map { |piece| piece.new("white")}
      
      @game_board = [row_8, row_7, row_6, row_5, row_4, row_3, row_2, row_1].flatten
    end
  end
end