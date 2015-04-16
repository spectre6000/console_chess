require "spec_helper"

module ConsoleChess
  describe King do
    let (:board) {Board.new}
    let (:wking) {King.new("e", "1", "White", board)}
    let (:bking) {King.new("e", "8", "Black", board)}
    let (:wkingii) {King.new("e", "4", "White", board)}
    let (:bkingii) {King.new("e", "5", "Black", board)}

    it "initializes with the correct 'color'" do
      expect(wking.token).to eql("K")
      expect(bking.token).to eql("k")
    end

    it "initializes with the correct position" do
      expect(wking.position).to eql("e1")
      expect(bking.position).to eql("e8")
    end

    it "populates the correct collection of initial available moves" do
      wkingii.populate_available_moves
      bkingii.populate_available_moves
      wking.populate_available_moves
      bking.populate_available_moves

      expect(wkingii.available_moves).to eql(["d5", "d4", "d3", "e5", "e3", "f5",  "f4", "f3"])
      expect(bkingii.available_moves).to eql(["d4", "d5", "d6", "e4", "e6", "f4", "f5", "f6"])
      expect(wking.available_moves).to eql([])
      expect(bking.available_moves).to eql([])
    end

    it "correctly determines whether or not a target move is available" do
      expect(wkingii.available_move?("Kd5")).to eql(true)
      expect(wkingii.available_move?("Kd2")).to eql(false)
      expect(bkingii.available_move?("kd5")).to eql(true)
      expect(bkingii.available_move?("kd2")).to eql(false)
    end

    it "castles" do
      [1, 2, 3, 5, 6, -2, -3, -5, -6, -7].each do |x|
        board.game_board[x].instance_variable_set(:@token, "_")
      end
      
      wking.populate_available_moves
      bking.populate_available_moves

      expect(wking.available_moves).to eql(["d1", "f1", "c1", "g1"])
      expect(bking.available_moves).to eql(["d8", "f8", "c8", "g8"])
    end

  end
end






