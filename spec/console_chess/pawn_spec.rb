require "spec_helper.rb"

module ConsoleChess
  describe Pawn do
    let (:board) {Board.new}
    let (:wpawn) {Pawn.new("h", "2", "White", board)}
    let (:bpawn) {Pawn.new("a", "7", "Black", board)}

    it "initializes with the correct 'color'" do
      expect(wpawn.token).to eql("P")
      expect(bpawn.token).to eql("p")
    end

    it "initializes with the correct position" do
      expect(wpawn.position).to eql("h2")
      expect(bpawn.position).to eql("a7")
    end

    it "populates the correct collection of available moves" do
      wpawn.populate_available_moves
      bpawn.populate_available_moves

      expect(wpawn.available_moves).to eql(["h3", "h4"])
      expect(bpawn.available_moves).to eql(["a6", "a5"])
    end

    it "correctly determines whether or not a target starting move is available" do
      expect(wpawn.available_move?("_h3")).to eql(true)
      expect(wpawn.available_move?("_h4")).to eql(true)
      expect(wpawn.available_move?("_h5")).to eql(false)
      expect(bpawn.available_move?("_a6")).to eql(true)
      expect(bpawn.available_move?("_a5")).to eql(true)
      expect(bpawn.available_move?("_a4")).to eql(false)
    end

    it "recognizes a potential capture including en passant" do
      board.game_board[-18].instance_variable_set(:@token, "p")
      board.game_board[-26].instance_variable_set(:@token, "p")
      board.game_board[17].instance_variable_set(:@token, "P")
      board.game_board[25].instance_variable_set(:@token, "P")

      expect(wpawn.available_move?("pg3")).to eql(true)
      expect(wpawn.available_move?("pg4")).to eql(true)
      expect(bpawn.available_move?("Pb6")).to eql(true)
      expect(bpawn.available_move?("Pb5")).to eql(true)
    end

  end
end