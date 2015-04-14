require "spec_helper.rb"

module ConsoleChess
  describe Pawn do
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

    it "populates the correct collection of available moves" do
      wpawn.populate_available_moves(true)
      bpawn.populate_available_moves(false)

      expect(wpawn.available_moves).to eql(["h3", "h4", "g3", "g4"])
      expect(bpawn.available_moves).to eql(["a6", "a5"])
    end

    it "correctly determines whether or not a target move is available" do
      expect(wpawn.available_move?("Ph3", false)).to eql(true)
      expect(wpawn.available_move?("Ph5", false)).to eql(false)
      expect(bpawn.available_move?("pa6", false)).to eql(true)
      expect(bpawn.available_move?("pa4", false)).to eql(false)
    end

  end
end