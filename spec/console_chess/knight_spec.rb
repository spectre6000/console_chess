require "spec_helper"

module ConsoleChess
  describe Knight do
      let (:bknight) {Knight.new("b", "black")}
      let (:wknight) {Knight.new("g", "white")}

    it "initializes with the correct 'color'" do
      expect(bknight.token).to eql("n")
      expect(wknight.token).to eql("N")
    end

    it "initializes with the correct position" do
      expect(bknight.position).to eql("b8")
      expect(wknight.position).to eql("g1")
    end
  end
end