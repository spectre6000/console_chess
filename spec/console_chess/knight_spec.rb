require "spec_helper"

module ConsoleChess
  describe Knight do
    it "initializes with the correct 'color'" do
      bknight = Knight.new("black")
      wknight = Knight.new("white")

      expect(bknight.token).to eql("n")
      expect(wknight.token).to eql("N")
    end
  end
end