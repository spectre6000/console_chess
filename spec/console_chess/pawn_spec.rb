require "spec_helper.rb"

module ConsoleChess
  describe Pawn do
    it "initializes with the correct 'color'" do
      bpawn = Pawn.new("black")
      wpawn = Pawn.new("white")

      expect(bpawn.token).to eql("p")
      expect(wpawn.token).to eql("P")
    end
  end
end