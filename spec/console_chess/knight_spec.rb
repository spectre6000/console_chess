require "spec_helper"

module ConsoleChess
  describe Knight do
      let (:bknight) {Knight.new("b", "8", "Black")}
      let (:wknight) {Knight.new("g", "1", "White")}

    it "initializes with the correct 'color'" do
      expect(bknight.token).to eql("n")
      expect(wknight.token).to eql("N")
    end

    it "initializes with the correct position" do
      expect(bknight.position).to eql("b8")
      expect(wknight.position).to eql("g1")
    end

    it "starts with the correct collection of available moves" do

    end
  end
end