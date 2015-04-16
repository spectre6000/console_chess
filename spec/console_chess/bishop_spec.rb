require "spec_helper"

module ConsoleChess
  describe Bishop do
    let (:board) {Board.new}
    let (:bbishop) {Bishop.new("c", "8", "Black", board)}
    let (:wbishop) {Bishop.new("f", "1", "White", board)}

    it "initializes with the correct 'color'" do
      expect(bbishop.token).to eql("b")
      expect(wbishop.token).to eql("B")
    end

    it "initializes with the correct position" do
      expect(bbishop.position).to eql("c8")
      expect(wbishop.position).to eql("f1")
    end

    it "starts with the correct collection of available moves" do
      #this could be the final test
    end
  end
end