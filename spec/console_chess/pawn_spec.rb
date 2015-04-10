require "spec_helper.rb"

module ConsoleChess
  describe Pawn do
    let (:bpawn) {Pawn.new(1, "Black")}
    let (:wpawn) {Pawn.new(8, "White")}

    it "initializes with the correct 'color'" do
      expect(bpawn.token).to eql("p")
      expect(wpawn.token).to eql("P")
    end

    it "initializes with the correct position" do
      expect(bpawn.position).to eql("a7")
      expect(wpawn.position).to eql("h2")
    end

  end
end