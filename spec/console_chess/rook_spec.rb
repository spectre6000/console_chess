require "spec_helper"

module ConsoleChess
  describe Rook do
    let (:brook) {Rook.new("a", "Black")}
    let (:wrook) {Rook.new("h", "White")}

    it "initializes with the correct 'color'" do
      expect(brook.token).to eql("r")
      expect(wrook.token).to eql("R")
    end

    it "initializes with the correct position" do
      expect(brook.position).to eql("a8")
      expect(wrook.position).to eql("h1")
    end

    it "starts with the correct collection of available moves" do

    end
  end
end