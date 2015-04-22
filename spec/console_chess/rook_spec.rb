require "spec_helper"

module ConsoleChess
  describe Rook do
    pieces_setup_array = [[:wrook, "h", "1", "White"], 
    [:brook, "a", "8", "Black"], [:mrook, "e", "4", "Black"]]

    let (:board) {Board.new}
    pieces_setup_array.each {|x, y, z, a| let (x) {Rook.new(y, z, a, board)}}

    it "initializes with the correct 'color'" do
      spec_array = [[wrook, "R"], [brook, "r"]]
      
      spec_array.each {|x, y| expect(x.token).to eql(y)}
    end

    it "initializes with the correct position" do
      spec_array = [[wrook, "h1"], [brook, "a8"]]

      spec_array.each {|x, y| expect(x.position).to eql(y)}
    end

    it "starts with the correct collection of available moves" do
      spec_array = [wrook, brook]

      spec_array.each do |x| 
        x.populate_available_moves
        expect(x.available_moves).to eql([])
      end
    end

    it "populates the correct collection of moves after start" do
      mrook.populate_available_moves

      expect(mrook.available_moves).to eql(["e5", "e6", "e3", "e2", "d4", "c4", "b4", "a4", "f4", "g4", "h4"])
    end
  end
end