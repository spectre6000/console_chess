require "spec_helper"

module ConsoleChess
  describe Rook do
    it "initializes with the correct 'color'" do
      brook = Rook.new("black")
      wrook = Rook.new("white")

      expect(brook.token).to eql("r")
      expect(wrook.token).to eql("R")
    end
  end
end