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

      expect(fake_printer).to have_received(:print).with("|r|n|b|q|k|b|n|r|\n|p|p|p|p|p|p|p|p|\n|_|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|_|\n|P|P|P|P|P|P|P|P|\n|R|N|B|Q|K|B|N|R|\n")
    end
  end
end