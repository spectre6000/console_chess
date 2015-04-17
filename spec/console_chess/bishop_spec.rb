require "spec_helper"

module ConsoleChess
  describe Bishop do
    let (:board) {Board.new}
    let (:wbishop) {Bishop.new("f", "1", "White", board)}
    let (:bbishop) {Bishop.new("c", "8", "Black", board)}
    let (:mbishop) {Bishop.new("e", "4", "Black", board)}

    it "initializes with the correct 'color'" do
      expect(wbishop.token).to eql("B")
      expect(bbishop.token).to eql("b")
    end

    it "initializes with the correct position" do
      expect(wbishop.position).to eql("f1")
      expect(bbishop.position).to eql("c8")
    end

    it "starts with the correct collection of available moves" do
      wbishop.populate_available_moves
      bbishop.populate_available_moves

      expect(wbishop.available_moves).to eql([])
      expect(bbishop.available_moves).to eql([])
    end
    
    it "populates the correct collection of moves after start" do
      mbishop.populate_available_moves

      expect(mbishop.available_moves).to eql(["d3", "c2", "d5", "c6", "f3", "g2", "f5", "g6"])
    end

  end
end