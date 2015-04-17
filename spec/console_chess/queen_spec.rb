require "spec_helper"

module ConsoleChess
  describe Queen do
    let (:board) {Board.new}
    let (:wqueen) {Queen.new("d", "1", "White", board)}
    let (:bqueen) {Queen.new("d", "8", "Black", board)}
    let (:mqueen) {Queen.new("e", "4", "Black", board)}

    it "initializes with the correct 'color'" do
      expect(wqueen.token).to eql("Q")
      expect(bqueen.token).to eql("q")
    end

    it "initializes with the correct position" do
      expect(wqueen.position).to eql("d1")
      expect(bqueen.position).to eql("d8")
    end

    it "starts with the correct collection of available moves" do
      wqueen.populate_available_moves
      bqueen.populate_available_moves

      expect(wqueen.available_moves).to eql([])
      expect(bqueen.available_moves).to eql([])
    end

    it "populates the correct collection of moves after start" do
      mqueen.populate_available_moves

      expect(mqueen.available_moves).to eql(["d3", "c2", "d5", "c6", "f3", "g2", "f5", "g6", "e5", "e6", "e3", "e2", "d4", "c4", "b4", "a4", "f4", "g4", "h4"])
    end

  end
end