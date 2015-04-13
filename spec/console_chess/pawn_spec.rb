require "spec_helper.rb"

module ConsoleChess
  describe Pawn do
    let (:board) {Board.new}
    let (:bpawn) {Pawn.new("a", "7", "Black")}
    let (:wpawn) {Pawn.new("h", "2", "White")}

    it "initializes with the correct 'color'" do
      expect(bpawn.token).to eql("p")
      expect(wpawn.token).to eql("P")
    end

    it "initializes with the correct position" do
      expect(bpawn.position).to eql("a7")
      expect(wpawn.position).to eql("h2")
    end

    xit "calculates potential moves" do
      bpawn.populate_available_moves(board.game_board)
      wpawn.populate_available_moves(board.game_board)

      expect(bpawn.available_moves).to eql(["_a6", "_a5"])
      expect(wpawn.available_moves).to eql(["_h3", "_h4"])
    end

  end
end