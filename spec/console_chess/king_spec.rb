require "spec_helper.rb"

module ConsoleChess
  describe King do
      let (:bking) {King.new("e", "8", "Black")}
      let (:wking) {King.new("e", "1", "White")}

    it "initializes with the correct 'color'" do
      expect(bking.token).to eql("k")
      expect(wking.token).to eql("K")
    end

    it "initializes with the correct position" do
      expect(bking.position).to eql("e8")
      expect(wking.position).to eql("e1")
    end

    it "starts with the correct collection of available moves" do
      wking.populate_available_moves
      expect(wking.available_moves).to eql(["d2", "e2", "f2", "d1", "f1"])
    end

  end
end