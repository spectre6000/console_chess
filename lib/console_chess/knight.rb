require "console_chess/space"

module ConsoleChess
  class Knight < Space

    def set_token; @row == "8" ? @token = "n" : @token = "N"; end

    def populate_available_moves
      @available_moves = []

      x1 = [@column.ord - 2, @column.ord + 2]
      y1 = [forward , backward ]
      x2 = [left, right]
      y2 = [ @row.to_i + 2 , @row.to_i - 2 ]

      x1.each do |x|
        y1.each do |y|
          move = "#{x.chr}#{y}"
          @available_moves << move if on_board?(x, y) && (capture?(move) || empty?(move))
        end
      end

      x2.each do |x|
        y2.each do |y|
          move = "#{x.chr}#{y}"
          @available_moves << move if on_board?(x, y) && (capture?(move) || empty?(move))
        end
      end
    end

  end 
end