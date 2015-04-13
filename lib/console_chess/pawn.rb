require "console_chess/space"

module ConsoleChess
  class Pawn < Space

    @move_count = 0

    def set_token
      @row == "7" ? @token = "p" : @token = "P"
    end

    def legal_move?(target, game_board)
      # populate_available_moves(game_board)
      # @available_moves.contains?(target)
    end

    # def populate_available_moves(game_board)
    #   #move one space forward if not occupied
    #   if game_board.any? {|space| space.call_sign == "_#{@column}#{@token == "p" ? @row.to_i - 1 : @row.to_i + 1}"}
    #     @available_moves << "_#{@column}#{@token == "p" ? @row.to_i - 1 : @row.to_i + 1}"
    #   end
    #   #move forward two spaces if not occupied and first move
    #   if ((@token == "p" && @row == "7") || (@token == "P" && @row == "2")) && game_board.any? {|space| space.call_sign == "_#{@column}#{@token == "p" ? @row.to_i - 2 : @row.to_i + 2}"}
    #     @available_moves << "_#{@column}#{@token == "p" ? @row.to_i - 2 : @row.to_i + 2}" 
    #   end

    #   #capture one space forward and to either side if occupied
    #   # game_board.any? {|space| space.call_sign == "#{ =~ /[PpRrNnBbQqKk]/ }#{row + 1}#{column + 1}"} ? @available_moves << "#{ =~ /[PpRrNnBbQqKk]/ }#{row + 2}#{column}"
    #   # game_board.any? {|space| space.call_sign == "#{ =~ /[PpRrNnBbQqKk]/ }#{row + 1}#{column - 1}"} ? @available_moves << "#{ =~ /[PpRrNnBbQqKk]/ }#{row + 2}#{column}"
    #   if game_board.any? {|space| space.call_sign == "_#{@column}#{@token == "p" ? @row.to_i - 1 : @row.to_i + 1}"}
    #     @available_moves << "_#{@column}#{@token == "p" ? @row.to_i - 1 : @row.to_i + 1}"
    #   end
      
    #   #en passant
    #   # game_board.any? {|space| space.call_sign == "#{ =~ /[PpRrNnBbQqKk]/ }#{row + 2}#{column + 1}"} && @move_count == 0 ? @available_moves << "#{ =~ /[PpRrNnBbQqKk]/ }#{row + 2}#{column}"
    #   # game_board.any? {|space| space.call_sign == "#{ =~ /[PpRrNnBbQqKk]/ }#{row + 2}#{column - 1}"} && @move_count == 0 ? @available_moves << "#{ =~ /[PpRrNnBbQqKk]/ }#{row + 2}#{column}"
    # end

    # def occupied?(target)
    #   target[0] != "_" ? true : false
    # end

  end
end