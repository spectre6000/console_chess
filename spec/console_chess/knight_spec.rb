require "spec_helper"

module ConsoleChess
  describe Knight do
    pieces_setup_array = [[:wknight, "g", "1", "White"], [:bknight, "b", "8", "Black"],
    [:mknight, "d", "4", "Black"]]

    let (:board) {Board.new}
    pieces_setup_array.each {|x, y, z, a| let (x) {Knight.new(y, z, a, board)}}

    it "initializes with the correct 'color'" do
      spec_array = [[wknight, "N"], [bknight, "n"]]

      spec_array.each {|x, y| expect(x.token).to eql(y)}
    end

    it "initializes with the correct position" do
      spec_array = [[wknight, "g1"], [bknight, "b8"]]
      
      spec_array.each {|x, y| expect(x.position).to eql(y)}
    end

    it "starts with the correct collection of available moves" do
      spec_array = [[wknight, ["f3", "h3"]], [bknight, ["a6", "c6"]]]
      
      spec_array.each do |x, y|
        x.populate_available_moves
        expect(x.available_moves).to eql(y)
      end
    end

    it "populates the correct collection of moves after start" do
      mknight.populate_available_moves

      expect(mknight.available_moves).to eql(["b3", "b5", "f3", "f5", "c2", "c6", "e2", "e6"])
    end
  end
end