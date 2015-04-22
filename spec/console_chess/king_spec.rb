require "spec_helper"

module ConsoleChess
  describe King do
    pieces_setup_array = [[:wking, "e", "1", "White"], [:bking, "e", "8", "Black"],
    [:wkingii, "e", "4", "White"], [:bkingii, "e", "5", "Black"]]
    let (:board) {Board.new}

    pieces_setup_array.each {|x, y, z, a| let (x) {King.new(y, z, a, board)}}

    it "initializes with the correct 'color'" do
      spec_array = [[wking, "K"], [bking, "k"]]

      spec_array.each {|x, y| expect(x.token).to eql(y)}
    end

    it "initializes with the correct position" do
      spec_array = [[wking, "e1"], [bking, "e8"]]

      spec_array.each {|x, y| expect(x.position).to eql(y)}
    end

    it "populates the correct collection of initial available moves" do
      spec_array = [[wkingii, ["d5", "d4", "d3", "e5", "e3", "f5", "f4", "f3"]],
      [bkingii, ["d4", "d5", "d6", "e4", "e6", "f4", "f5", "f6"]],
      [wking, []], [bking, []]]

      spec_array.each do |x, y|
        x.populate_available_moves
        expect(x.available_moves).to eql(y)
      end
    end

    it "correctly determines whether or not a target move is available" do
      spec_array = [[wkingii, "Kd5", true], [wkingii, "Kd2", false], 
      [bkingii, "kd5", true], [bkingii, "kd2", false]]
      
      spec_array.each {|x, y, z| expect(x.available_move?(y)).to eql(z)}
    end

    it "castles" do
      [1, 2, 3, 5, 6, -2, -3, -5, -6, -7].each do |x|
        board.game_board[x].instance_variable_set(:@token, "_")
      end
      spec_array = [[wking, ["d1", "f1", "c1", "g1"]], [bking, ["d8", "f8", "c8", "g8"]]]
      
      spec_array.each do |x, y|
        x.populate_available_moves
        expect(x.available_moves).to eql(y)
      end
    end

  end
end