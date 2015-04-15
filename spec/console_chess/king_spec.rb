require "spec_helper.rb"

module ConsoleChess
  describe King do
    let (:wking) {King.new("e", "1", "White")}
    let (:bking) {King.new("e", "8", "Black")}
    let (:wkingii) {King.new("e", "4", "White")}
    let (:bkingii) {King.new("e", "5", "Black")}
    let (:board) {Board.new}

    it "initializes with the correct 'color'" do
      expect(wking.token).to eql("K")
      expect(bking.token).to eql("k")
    end

    it "initializes with the correct position" do
      expect(wking.position).to eql("e1")
      expect(bking.position).to eql("e8")
    end

    it "populates the correct collection of initial available moves" do
      wkingii.populate_available_moves(board.game_board)
      bkingii.populate_available_moves(board.game_board)
      wking.populate_available_moves(board.game_board)
      bking.populate_available_moves(board.game_board)

      expect(wkingii.available_moves).to eql(["d5", "d4", "d3", "e5", "e3", "f5",  "f4", "f3"])
      expect(bkingii.available_moves).to eql(["d6", "d5", "d4", "e6", "e4", "f6", "f5", "f4"])
      expect(wking.available_moves).to eql([])
      expect(bking.available_moves).to eql([])
    end

    it "correctly determines whether or not a target move is available" do
      expect(wkingii.available_move?("Kd5", board.game_board)).to eql(true)
      expect(wkingii.available_move?("Kd2", board.game_board)).to eql(false)
      expect(bkingii.available_move?("kd5", board.game_board)).to eql(true)
      expect(bkingii.available_move?("kd2", board.game_board)).to eql(false)
    end

    it "castles" do
      boardii = Board.new
      
      [1, 2, 3, 5, 6, -2, -3, -5, -6, -7].each do |x|
        boardii.game_board[x].instance_variable_set(:@token, "_")
      end
      
      wking.populate_available_moves(boardii.game_board)
      bking.populate_available_moves(boardii.game_board)

      expect(wking.available_moves).to eql(["d1", "f1", "c1", "g1"])
      expect(bking.available_moves).to eql(["d8", "f8", "c8", "g8"])
    end

  end
end





