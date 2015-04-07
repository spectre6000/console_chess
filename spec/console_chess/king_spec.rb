require "spec_helper.rb"

module ConsoleChess
  describe King do
    it "initializes with the correct 'color'" do
      bking = King.new("black")
      wking = King.new("white")

      expect(bking.token).to eql("k")
      expect(wking.token).to eql("K")
    end
  end
end