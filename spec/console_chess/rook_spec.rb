require "spec_helper"

module ConsoleChess
  describe Rook do
    let (:board) {Board.new}
    let (:wrook) {Rook.new("h", "1", "White", board)}
    let (:brook) {Rook.new("a", "8", "Black", board)}
    let (:mrook) {Rook.new("e", "4", "Black", board)}

    it "initializes with the correct 'color'" do
      expect(wrook.token).to eql("R")
      expect(brook.token).to eql("r")
    end

    it "initializes with the correct position" do
      expect(wrook.position).to eql("h1")
      expect(brook.position).to eql("a8")
    end

    it "starts with the correct collection of available moves" do
      wrook.populate_available_moves
      brook.populate_available_moves

      expect(wrook.available_moves).to eql([])
      expect(brook.available_moves).to eql([])
    end

    it "populates the correct collection of moves after start" do
      mrook.populate_available_moves

      expect(mrook.available_moves).to eql(["a4", "b4", "c4", "d4", "h4", "g4", "f4", "e6", "e5", "e2", "e3"])
    end
  end
end