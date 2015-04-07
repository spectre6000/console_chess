require "spec_helper"

module ConsoleChess
  describe Board do
    let (:fake_printer) {instance_double(Printer, :print => true)}
    let (:board) {Board.new(fake_printer)}

    it "keeps the game going" do
      expect(board.continue).to eql(true)
    end

    it "prints the board" do
      board.print_board

      expect(fake_printer).to have_received(:print).with("   a b c d e f g h\n8 |r|n|b|q|k|b|n|r| 8\n7 |p|p|p|p|p|p|p|p| 7\n6 |_|_|_|_|_|_|_|_| 6\n5 |_|_|_|_|_|_|_|_| 5\n4 |_|_|_|_|_|_|_|_| 4\n3 |_|_|_|_|_|_|_|_| 3\n2 |P|P|P|P|P|P|P|P| 2\n1 |R|N|B|Q|K|B|N|R| 1\n   a b c d e f g h")
    end
  end
end