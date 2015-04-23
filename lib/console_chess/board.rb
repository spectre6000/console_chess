module ConsoleChess
  class Board

    attr_reader :game_board

    def initialize
      @game_board
      new_board
      @captured_pieces
    end

    def new_board
      primary_pieces = [[Rook, "a"], [Knight, "b"], [Bishop, "c"], [Queen, "d"], [King, "e"], [Bishop, "f"], [Knight, "g"], [Rook, "h"]]
      columns = ["a", "b", "c", "d", "e", "f", "g", "h"]

      row_8 = primary_pieces.map { |piece, column| piece.new(column, "8", "Black", self)}
      row_7 = columns.map { |column| ConsoleChess::Pawn.new(column, "7", "Black", self)}
      row_6 = columns.map { |column| ConsoleChess::Space.new(column, "6", "_", self)}
      row_5 = columns.map { |column| ConsoleChess::Space.new(column, "5", "_", self)}
      row_4 = columns.map { |column| ConsoleChess::Space.new(column, "4", "_", self)}
      row_3 = columns.map { |column| ConsoleChess::Space.new(column, "3", "_", self)}
      row_2 = columns.map { |column| ConsoleChess::Pawn.new(column, "2", "White", self)}
      row_1 = primary_pieces.map { |piece, column| piece.new(column, "1", "White", self)}
      
      @game_board = [row_8, row_7, row_6, row_5, row_4, row_3, row_2, row_1].flatten
    end

    def print_board
      "   a b c d e f g h\n8 |#{get_piece_in_position("a8").token}|#{get_piece_in_position("b8").token}|#{get_piece_in_position("c8").token}|#{get_piece_in_position("d8").token}|#{get_piece_in_position("e8").token}|#{get_piece_in_position("f8").token}|#{get_piece_in_position("g8").token}|#{get_piece_in_position("h8").token}| 8\n7 |#{get_piece_in_position("a7").token}|#{get_piece_in_position("b7").token}|#{get_piece_in_position("c7").token}|#{get_piece_in_position("d7").token}|#{get_piece_in_position("e7").token}|#{get_piece_in_position("f7").token}|#{get_piece_in_position("g7").token}|#{get_piece_in_position("h7").token}| 7\n6 |#{get_piece_in_position("a6").token}|#{get_piece_in_position("b6").token}|#{get_piece_in_position("c6").token}|#{get_piece_in_position("d6").token}|#{get_piece_in_position("e6").token}|#{get_piece_in_position("f6").token}|#{get_piece_in_position("g6").token}|#{get_piece_in_position("h6").token}| 6\n5 |#{get_piece_in_position("a5").token}|#{get_piece_in_position("b5").token}|#{get_piece_in_position("c5").token}|#{get_piece_in_position("d5").token}|#{get_piece_in_position("e5").token}|#{get_piece_in_position("f5").token}|#{get_piece_in_position("g5").token}|#{get_piece_in_position("h5").token}| 5\n4 |#{get_piece_in_position("a4").token}|#{get_piece_in_position("b4").token}|#{get_piece_in_position("c4").token}|#{get_piece_in_position("d4").token}|#{get_piece_in_position("e4").token}|#{get_piece_in_position("f4").token}|#{get_piece_in_position("g4").token}|#{get_piece_in_position("h4").token}| 4\n3 |#{get_piece_in_position("a3").token}|#{get_piece_in_position("b3").token}|#{get_piece_in_position("c3").token}|#{get_piece_in_position("d3").token}|#{get_piece_in_position("e3").token}|#{get_piece_in_position("f3").token}|#{get_piece_in_position("g3").token}|#{get_piece_in_position("h3").token}| 3\n2 |#{get_piece_in_position("a2").token}|#{get_piece_in_position("b2").token}|#{get_piece_in_position("c2").token}|#{get_piece_in_position("d2").token}|#{get_piece_in_position("e2").token}|#{get_piece_in_position("f2").token}|#{get_piece_in_position("g2").token}|#{get_piece_in_position("h2").token}| 2\n1 |#{get_piece_in_position("a1").token}|#{get_piece_in_position("b1").token}|#{get_piece_in_position("c1").token}|#{get_piece_in_position("d1").token}|#{get_piece_in_position("e1").token}|#{get_piece_in_position("f1").token}|#{get_piece_in_position("g1").token}|#{get_piece_in_position("h1").token}| 1\n   a b c d e f g h"
    end

    def check_for_check
      check = false
      @game_board.each do |x| 
        x.populate_available_moves
        if x.available_moves.include?(find_kings[0]) || x.available_moves.include?(find_kings[1])
          check = true
          break
        end
      end
      check
    end

    def find_kings
      [(@game_board.find { |piece| piece.token == "k"}).position, (@game_board.find { |piece| piece.token == "K"}).position]
    end

    def winner?
      #this will need logic to determine whether or not anyone has won
      # true
      false
    end

    def piece_in_place?(piece); @game_board.any? {|space| space.call_sign == piece} ? true : false; end

    def legal_move?(start, target); get_piece(start).available_move?(target); end

    def commit_move(move)
      start = move.split(" ")[0]
      target = move.split(" ")[2]
      from = get_piece(start).position
      to = get_piece(target).position
      get_piece(start).populate_available_moves
  
      if king?(start) && unmoved?(start) && special_move_available?(start, to)
        castle(start, target, to, from)
      elsif pawn?(start) && unmoved?(start) && special_move_available?(start, to)
        en_passant(start, target, to, from)
      elsif target[0] != "_"
        simple_capture(start, target, to, from)
      elsif target[0] == "_"
        simple_move(start, target, to, from)
      end
    end

    def get_piece(call_sign); @game_board.find { |piece| piece.call_sign == call_sign}; end

    def get_piece_in_position(position); @game_board.find { |piece| piece.position == position}; end

    def king?(call_sign); ["k", "K"].any?{ |x| get_piece(call_sign).token == x}; end

    def pawn?(call_sign); ["p", "P"].any? { |x| get_piece(call_sign).token == x}; end

    def unmoved?(call_sign); get_piece(call_sign).move_count == 0 ? true : false; end

    def special_move_available?(call_sign, target_position)
      ["#{target_position}C", "#{target_position}EP"].any? { |x| get_piece(call_sign).available_moves.include?(x) }
    end

    def simple_move(start, target, to, from); get_piece(start).commit_move(to); get_piece(target).commit_move(from); end

    def simple_capture(start, target, to, from)
      simple_move(start, target, to, "__")
      @game_board << ConsoleChess::Space.new(from[0], from[1], "_", self)
    end

    def en_passant(start, target, to, from)
      start[0] == "p" ? ep_target = "#{to[0]}6" : ep_target = "#{to[0]}3"

      simple_move(start, target, to, from)
      get_piece(get_piece_in_position(ep_target).call_sign).commit_move("__")
      @game_board <<  ConsoleChess::Space.new(ep_target[0], ep_target[1], "_", self)
    end

    def castle(start, target, to, from)
      if start[0] == "k" 
        if target[1] == "c" 
          rook, rook_pos, space_pos = "ra8", "d8", "a8"
        else
          rook, rook_pos, space_pos = "rh8", "f8", "h8"
        end
      else
        if target[1] == "c"
          rook, rook_pos, space_pos = "Ra1", "d1", "a1"
        else
          rook, rook_pos, space_pos = "Rh1", "f1", "h1"
        end
      end
      simple_move(start, target, to, from)
      get_piece(rook).commit_move(rook_pos)
      get_piece("_#{rook_pos}").commit_move(space_pos)
    end

  end
end