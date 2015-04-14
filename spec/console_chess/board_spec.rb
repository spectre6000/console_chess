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
      expect(board.game_board[0].call_sign).to eq("ra8")
      expect(board.game_board[1].call_sign).to eq("nb8")
      expect(board.game_board[2].call_sign).to eq("bc8")
      expect(board.game_board[3].call_sign).to eq("qd8")
      expect(board.game_board[4].call_sign).to eq("ke8")
      expect(board.game_board[5].call_sign).to eq("bf8")
      expect(board.game_board[6].call_sign).to eq("ng8")
      expect(board.game_board[7].call_sign).to eq("rh8")
      expect(board.game_board[8].call_sign).to eq("pa7")
      expect(board.game_board[9].call_sign).to eq("pb7")
      expect(board.game_board[10].call_sign).to eq("pc7")
      expect(board.game_board[11].call_sign).to eq("pd7")
      expect(board.game_board[12].call_sign).to eq("pe7")
      expect(board.game_board[13].call_sign).to eq("pf7")
      expect(board.game_board[14].call_sign).to eq("pg7")
      expect(board.game_board[15].call_sign).to eq("ph7")
      expect(board.game_board[16].call_sign).to eq("_a6")
      expect(board.game_board[17].call_sign).to eq("_b6")
      expect(board.game_board[18].call_sign).to eq("_c6")
      expect(board.game_board[19].call_sign).to eq("_d6")
      expect(board.game_board[20].call_sign).to eq("_e6")
      expect(board.game_board[21].call_sign).to eq("_f6")
      expect(board.game_board[22].call_sign).to eq("_g6")
      expect(board.game_board[23].call_sign).to eq("_h6")
      expect(board.game_board[24].call_sign).to eq("_a5")
      expect(board.game_board[25].call_sign).to eq("_b5")
      expect(board.game_board[26].call_sign).to eq("_c5")
      expect(board.game_board[27].call_sign).to eq("_d5")
      expect(board.game_board[28].call_sign).to eq("_e5")
      expect(board.game_board[29].call_sign).to eq("_f5")
      expect(board.game_board[30].call_sign).to eq("_g5")
      expect(board.game_board[31].call_sign).to eq("_h5")
      expect(board.game_board[32].call_sign).to eq("_a4")
      expect(board.game_board[33].call_sign).to eq("_b4")
      expect(board.game_board[34].call_sign).to eq("_c4")
      expect(board.game_board[35].call_sign).to eq("_d4")
      expect(board.game_board[36].call_sign).to eq("_e4")
      expect(board.game_board[37].call_sign).to eq("_f4")
      expect(board.game_board[38].call_sign).to eq("_g4")
      expect(board.game_board[39].call_sign).to eq("_h4")
      expect(board.game_board[40].call_sign).to eq("_a3")
      expect(board.game_board[41].call_sign).to eq("_b3")
      expect(board.game_board[42].call_sign).to eq("_c3")
      expect(board.game_board[43].call_sign).to eq("_d3")
      expect(board.game_board[44].call_sign).to eq("_e3")
      expect(board.game_board[45].call_sign).to eq("_f3")
      expect(board.game_board[46].call_sign).to eq("_g3")
      expect(board.game_board[47].call_sign).to eq("_h3")
      expect(board.game_board[48].call_sign).to eq("Pa2")
      expect(board.game_board[49].call_sign).to eq("Pb2")
      expect(board.game_board[50].call_sign).to eq("Pc2")
      expect(board.game_board[51].call_sign).to eq("Pd2")
      expect(board.game_board[52].call_sign).to eq("Pe2")
      expect(board.game_board[53].call_sign).to eq("Pf2")
      expect(board.game_board[54].call_sign).to eq("Pg2")
      expect(board.game_board[55].call_sign).to eq("Ph2")
      expect(board.game_board[56].call_sign).to eq("Ra1")
      expect(board.game_board[57].call_sign).to eq("Nb1")
      expect(board.game_board[58].call_sign).to eq("Bc1")
      expect(board.game_board[59].call_sign).to eq("Qd1")
      expect(board.game_board[60].call_sign).to eq("Ke1")
      expect(board.game_board[61].call_sign).to eq("Bf1")
      expect(board.game_board[62].call_sign).to eq("Ng1")
      expect(board.game_board[63].call_sign).to eq("Rh1")
    end

    it "knows when a piece is in a given place" do
      expect(board.piece_in_place?("Pa2")).to eql(true)
    end

    it "knows when a piece is not in a given place" do
      expect(board.piece_in_place?("Pa3")).to eql(false)
    end

    it "doesn't allow one to capture one's own piece" do
      expect(board.friendly_fire?("ka1", "qa2")).to eql(true)
      expect(board.friendly_fire?("Ka1", "Qa2")).to eql(true)
      expect(board.friendly_fire?("ka1", "Ka2")).to eql(false)
      expect(board.friendly_fire?("ka1", "_a2")).to eql(false)
    end

    it "knows when a piece is being captured" do
      expect(board.capture?("ka1", "_a2")).to eql(false)
      expect(board.capture?("Ka1", "Ka2")).to eql(false)
      expect(board.capture?("ka1", "Ka2")).to eql(true)
    end

    it "returns true if a piece can make a given move" do
      expect(board.legal_move?("Pa2", "Pc3")).to eql(true)
    end

    # it "returns false if a piece can not make a given move" do
    #   expect(board.legal_move?("Pa2", "Pc7")).to eql(false)
    # end

  end
end