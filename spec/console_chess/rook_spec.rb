require "spec_helper"

module ConsoleChess
  describe Rook do
    let (:brook) {Rook.new("black", "a")}
    let (:wrook) {Rook.new("white", "h")}

    it "initializes with the correct 'color'" do
      expect(brook.token).to eql("r")
      expect(wrook.token).to eql("R")
    end

    it "initializes with the correct position" do
      expect(brook.position).to eql("a8")
      expect(wrook.position).to eql("h1")
    end
  end
end