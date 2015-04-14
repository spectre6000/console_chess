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

    it "populates the correct collection of available moves" do
      wking.populate_available_moves(false)
      bking.populate_available_moves(false)

      expect(wking.available_moves).to eql(["d2", "e2", "f2", "d1", "f1"])
      expect(bking.available_moves).to eql(["d8", "f8", "d7", "e7", "f7"])
    end

    it "correctly determines whether or not a target move is available" do
      expect(wking.available_move?("Kd2", false)).to eql(true)
      expect(wking.available_move?("Kd5", false)).to eql(false)
      expect(bking.available_move?("kd8", false)).to eql(true)
      expect(bking.available_move?("kd5", false)).to eql(false)
    end

  end
end