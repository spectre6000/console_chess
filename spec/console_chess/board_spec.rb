require "spec_helper"

module ConsoleChess
  describe Board do
    let (:fake_printer) {instance_double(Printer, :print => true)}
    let (:board) {Board.new}

    it "keeps the game going" do
      expect(board.winner?).to eql(true)
    end

    it "prints the board" do
      expect(board.print_board).to eq("   a b c d e f g h\n8 |r|n|b|q|k|b|n|r| 8\n7 |p|p|p|p|p|p|p|p| 7\n6 |_|_|_|_|_|_|_|_| 6\n5 |_|_|_|_|_|_|_|_| 5\n4 |_|_|_|_|_|_|_|_| 4\n3 |_|_|_|_|_|_|_|_| 3\n2 |P|P|P|P|P|P|P|P| 2\n1 |R|N|B|Q|K|B|N|R| 1\n   a b c d e f g h")
    end

    it "properly initializes pieces" do
      spec_array = [[0, "ra8"], [1, "nb8"], [2, "bc8"], [3, "qd8"], [4, "ke8"], [5, "bf8"], 
      [6, "ng8"], [7, "rh8"], [8, "pa7"], [9, "pb7"], [10, "pc7"], [11, "pd7"], [12, "pe7"], 
      [13, "pf7"], [14, "pg7"], [15, "ph7"], [16, "_a6"], [17, "_b6"], [18, "_c6"], [19, "_d6"], 
      [20, "_e6"], [21, "_f6"], [22, "_g6"], [23, "_h6"], [24, "_a5"], [25, "_b5"], [26, "_c5"], 
      [27, "_d5"], [28, "_e5"], [29, "_f5"], [30, "_g5"], [31, "_h5"], [32, "_a4"], [33, "_b4"], 
      [34, "_c4"], [35, "_d4"], [36, "_e4"], [37, "_f4"], [38, "_g4"], [39, "_h4"], [40, "_a3"], 
      [41, "_b3"], [42, "_c3"], [43, "_d3"], [44, "_e3"], [45, "_f3"], [46, "_g3"], [47, "_h3"], 
      [48, "Pa2"], [49, "Pb2"], [50, "Pc2"], [51, "Pd2"], [52, "Pe2"], [53, "Pf2"], [54, "Pg2"], 
      [55, "Ph2"], [56 ,"Ra1"], [57, "Nb1"], [58, "Bc1"], [59, "Qd1"], [60, "Ke1"], [61, "Bf1"], 
      [62, "Ng1"], [63, "Rh1"]]

      spec_array.each {|x, y| expect(board.game_board[x].call_sign).to eq(y)}
    end

    it "knows when a piece is in a given place" do
      spec_array = ["Pa2", "Pb2", "Qd1", "_h3", "ra8"]

      spec_array.each {|x| expect(board.piece_in_place?(x)).to eql(true)}
    end

    it "knows when a piece is not in a given place" do
      spec_array = ["Pa3", "Pb7", "Qd8", "_h1", "ra1"]
      
      spec_array.each {|x| expect(board.piece_in_place?(x)).to eql(false)}
    end

    it "knows when a piece can make a given move" do
      spec_array = [ ["Pa2", "_a3", true], ["Pa2", "_a4", true], ["Pa2", "_b4", false]]
      
      spec_array.each { |x, y, z| expect(board.legal_move?(x, y)).to eql(z) }
    end

  end
end