require "spec_helper"

module ConsoleChess
  describe Queen do
    it "initializes with the correct 'color'" do
      bqueen = Queen.new("black")
      wqueen = Queen.new("white")

      expect(bqueen.token).to eql("q")
      expect(wqueen.token).to eql("Q")
    end
  end
end