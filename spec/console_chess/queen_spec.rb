require "spec_helper"

module ConsoleChess
  describe Queen do
    pieces_setup_array = [[:wqueen, "d", "1", "White"], [:bqueen, "d", "8", "Black"],
    [:mqueen, "e", "4", "Black"]]

    let (:board) {Board.new}
    pieces_setup_array.each {|x, y, z, a| let (x) {Queen.new(y, z, a, board)}}

    it "initializes with the correct 'color'" do
      spec_array = [[wqueen, "Q"], [bqueen, "q"]]
      
      spec_array.each {|x, y| expect(x.token).to eql(y)}
    end

    it "initializes with the correct position" do
      spec_array = [[wqueen, "d1"], [bqueen, "d8"]]
      
      spec_array.each {|x, y| expect(x.position).to eql(y)}
    end

    it "starts with the correct collection of available moves" do
      spec_array = [wqueen, bqueen]
      
      spec_array.each do |x| 
        x.populate_available_moves
        expect(x.available_moves).to eql([])
      end
    end

    it "populates the correct collection of moves after start" do
      mqueen.populate_available_moves

      expect(mqueen.available_moves).to eql(["d3", "c2", "d5", "c6", "f3", "g2", "f5", "g6", "e5", "e6", "e3", "e2", "d4", "c4", "b4", "a4", "f4", "g4", "h4"])
    end

  end
end