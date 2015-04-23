require "spec_helper.rb"

module ConsoleChess
  describe Pawn do
    pieces_setup_array = [[:wpawn, "h", "2", "White"], [:bpawn, "a", "7", "Black"]]
    
    let (:fake_board) {Board.new}
    pieces_setup_array.each {|x, y, z, a| let (x) {Pawn.new(y, z, a, fake_board)}}

    it "initializes with the correct 'color'" do
      spec_array = [[wpawn, "P"], [bpawn, "p"]]
      
      spec_array.each {|x, y| expect(x.token).to eql(y)}
    end

    it "initializes with the correct position" do
      spec_array = [[wpawn, "h2"], [bpawn, "a7"]]
      
      spec_array.each {|x, y| expect(x.position).to eql(y)}
    end

    it "populates the correct collection of available moves" do
      spec_array = [[wpawn, ["h3", "h4"]], [bpawn, ["a6", "a5"]]]

      spec_array.each do |x, y|
        x.populate_available_moves
        expect(x.available_moves).to eql(y)
      end
    end

    it "correctly determines whether or not a target starting move is available" do
      spec_array = [[wpawn, "_h3", true], [wpawn, "_h4", true], [wpawn, "_h5", false],
      [bpawn, "_a6", true], [bpawn, "_a5", true], [bpawn, "_a4", false]]

      spec_array.each {|x, y, z| expect(x.available_move?(y)).to eql(z)}
    end

  end
end