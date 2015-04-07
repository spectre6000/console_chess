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
      @printer.print("   a b c d e f g h\n8 |#{@game_board[0].token}|#{@game_board[1].token}|#{@game_board[2].token}|#{@game_board[3].token}|#{@game_board[4].token}|#{@game_board[5].token}|#{@game_board[6].token}|#{@game_board[7].token}| 8\n7 |#{@game_board[8].token}|#{@game_board[9].token}|#{@game_board[10].token}|#{@game_board[11].token}|#{@game_board[12].token}|#{@game_board[13].token}|#{@game_board[14].token}|#{@game_board[15].token}| 7\n6 |#{@game_board[16].token}|#{@game_board[17].token}|#{@game_board[18].token}|#{@game_board[19].token}|#{@game_board[20].token}|#{@game_board[21].token}|#{@game_board[22].token}|#{@game_board[23].token}| 6\n5 |#{@game_board[24].token}|#{@game_board[25].token}|#{@game_board[26].token}|#{@game_board[27].token}|#{@game_board[28].token}|#{@game_board[29].token}|#{@game_board[30].token}|#{@game_board[31].token}| 5\n4 |#{@game_board[32].token}|#{@game_board[33].token}|#{@game_board[34].token}|#{@game_board[35].token}|#{@game_board[36].token}|#{@game_board[37].token}|#{@game_board[38].token}|#{@game_board[39].token}| 4\n3 |#{@game_board[40].token}|#{@game_board[41].token}|#{@game_board[42].token}|#{@game_board[43].token}|#{@game_board[44].token}|#{@game_board[45].token}|#{@game_board[46].token}|#{@game_board[47].token}| 3\n2 |#{@game_board[48].token}|#{@game_board[49].token}|#{@game_board[50].token}|#{@game_board[51].token}|#{@game_board[52].token}|#{@game_board[53].token}|#{@game_board[54].token}|#{@game_board[55].token}| 2\n1 |#{@game_board[56].token}|#{@game_board[57].token}|#{@game_board[58].token}|#{@game_board[59].token}|#{@game_board[60].token}|#{@game_board[61].token}|#{@game_board[62].token}|#{@game_board[63].token}| 1\n   a b c d e f g h")
    end

    def new_board
      primary_pieces = [[Rook, "a"], [Knight, "b"], [Bishop, "c"], [Queen, "d"], [King, "e"], [Bishop, "f"], [Knight, "g"], [Rook, "h"]]

      row_8 = primary_pieces.map { |piece, column| piece.new("black", column)}
      row_7 = (1..8).map { |pawn| ConsoleChess::Pawn.new("black", pawn)}
      row_6 = (1..8).map { |space| ConsoleChess::Space.new("6", space)}
      row_5 = (1..8).map { |space| ConsoleChess::Space.new("5", space)}
      row_4 = (1..8).map { |space| ConsoleChess::Space.new("4", space)}
      row_3 = (1..8).map { |space| ConsoleChess::Space.new("3", space)}
      row_2 = (1..8).map { |pawn| ConsoleChess::Pawn.new("white", pawn)}
      row_1 = primary_pieces.map { |piece, column| piece.new("white", column)}
      
      @game_board = [row_8, row_7, row_6, row_5, row_4, row_3, row_2, row_1].flatten
    end
  end
end