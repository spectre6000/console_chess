require "spec_helper"

module ConsoleChess
  describe Queen do
    let (:board) {Board.new}
    let (:bqueen) {Queen.new("d", "8", "Black", board)}
    let (:wqueen) {Queen.new("d", "1", "White", board)}


    it "initializes with the correct 'color'" do
      expect(bqueen.token).to eql("q")
      expect(wqueen.token).to eql("Q")
    end

    it "initializes with the correct position" do
      expect(bqueen.position).to eql("d8")
      expect(wqueen.position).to eql("d1")
    end

    it "starts with the correct collection of available moves" do

    end

  end
end