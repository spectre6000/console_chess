require "spec_helper.rb"

module ConsoleChess
  describe Pawn do
    let (:board) {Board.new}
    let (:wpawn) {Pawn.new("h", "2", "White", board)}
    let (:bpawn) {Pawn.new("a", "7", "Black", board)}

    it "initializes with the correct 'color'" do
      expect(wpawn.token).to eql("P")
      expect(bpawn.token).to eql("p")
    end

    it "initializes with the correct position" do
      expect(wpawn.position).to eql("h2")
      expect(bpawn.position).to eql("a7")
    end

    it "populates the correct collection of available moves" do
      wpawn.populate_available_moves
      bpawn.populate_available_moves

      expect(wpawn.available_moves).to eql(["h3", "h4"])
      expect(bpawn.available_moves).to eql(["a6", "a5"])
    end

    it "correctly determines whether or not a target move is available" do
      expect(wpawn.available_move?("Ph3")).to eql(true)
      expect(wpawn.available_move?("Ph5")).to eql(false)
      expect(bpawn.available_move?("pa6")).to eql(true)
      expect(bpawn.available_move?("pa4")).to eql(false)
    end

  end
end