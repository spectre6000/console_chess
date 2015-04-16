require "spec_helper"

module ConsoleChess
  describe Knight do
    let (:board) {Board.new}
    let (:wknight) {Knight.new("g", "1", "White", board)}
    let (:bknight) {Knight.new("b", "8", "Black", board)}
    let (:mknight) {Knight.new("d", "4", "Black", board)}

    it "initializes with the correct 'color'" do
      expect(wknight.token).to eql("N")
      expect(bknight.token).to eql("n")
    end

    it "initializes with the correct position" do
      expect(wknight.position).to eql("g1")
      expect(bknight.position).to eql("b8")
    end

    it "starts with the correct collection of available moves" do
      wknight.populate_available_moves
      bknight.populate_available_moves

      expect(wknight.available_moves).to eql(["f3", "h3"])
      expect(bknight.available_moves).to eql(["a6", "c6"])
    end

    it "populates the correct collection of moves after start" do
      mknight.populate_available_moves

      expect(mknight.available_moves).to eql(["b3", "b5", "f3", "f5", "c2", "c6", "e2", "e6"])
    end
  end
end