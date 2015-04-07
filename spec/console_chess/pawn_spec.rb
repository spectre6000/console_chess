require "spec_helper.rb"

module ConsoleChess
  describe Pawn do
    let (:bpawn) {Pawn.new("black", 1)}
    let (:wpawn) {Pawn.new("white", 8)}

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