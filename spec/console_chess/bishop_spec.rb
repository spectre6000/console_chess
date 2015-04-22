require "spec_helper"

module ConsoleChess
  describe Bishop do
    pieces_setup_array = [[:wbishop, "f", "1", "White"], 
    [:bbishop, "c", "8", "Black"], [:mbishop, "e", "4", "Black"]]
    
    let (:board) {Board.new}
    pieces_setup_array.each {|x, y, z, a| let (x) {Bishop.new(y, z, a, board)}}

    it "initializes with the correct 'color'" do
      spec_array = [[wbishop, "B"], [bbishop, "b"]]

      spec_array.each { |x, y| expect(x.token).to eql(y) }
    end

    it "initializes with the correct position" do
      spec_array = [[wbishop, "f1"], [bbishop, "c8"]]
      
      spec_array.each { |x, y| expect(x.position).to eql(y)}
    end

    it "starts with the correct collection of available moves" do
      spec_array = [wbishop, bbishop]

      spec_array.each do |x| 
        x.populate_available_moves
        expect(x.available_moves).to eql([])
      end
    end
    
    it "populates the correct collection of moves after start" do
      mbishop.populate_available_moves

      expect(mbishop.available_moves).to eql(["d3", "c2", "d5", "c6", "f3", "g2", "f5", "g6"])
    end

  end
end