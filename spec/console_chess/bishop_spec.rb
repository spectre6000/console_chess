require "spec_helper"

module ConsoleChess
  describe Bishop do
    it "initializes with the correct 'color'" do
      bbishop = Bishop.new("black")
      wbishop = Bishop.new("white")

      expect(bbishop.token).to eql("b")
      expect(wbishop.token).to eql("B")
    end
  end
end