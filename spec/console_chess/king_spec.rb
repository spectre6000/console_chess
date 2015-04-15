require "spec_helper.rb"

module ConsoleChess
  describe King do
      let (:bking) {King.new("e", "8", "Black")}
      let (:wking) {King.new("e", "1", "White")}
      let (:board) {Board.new}

    it "initializes with the correct 'color'" do
      expect(bking.token).to eql("k")
      expect(wking.token).to eql("K")
    end

    it "initializes with the correct position" do
      expect(bking.position).to eql("e8")
      expect(wking.position).to eql("e1")
    end

    it "populates the correct collection of initial available moves" do
      wking.populate_available_moves(board.game_board)
      bking.populate_available_moves(board.game_board)

      expect(wking.available_moves).to eql(["d2", "e2", "f2", "d1", "f1", "c1", "g1"])
      expect(bking.available_moves).to eql(["d8", "f8", "d7", "e7", "f7", "c8", "g8"])
    end

    it "correctly determines whether or not a target move is available" do
      expect(wking.available_move?("Kd2", board.game_board)).to eql(true)
      expect(wking.available_move?("Kd5", board.game_board)).to eql(false)
      expect(bking.available_move?("kd8", board.game_board)).to eql(true)
      expect(bking.available_move?("kd5", board.game_board)).to eql(false)
    end

  end
end