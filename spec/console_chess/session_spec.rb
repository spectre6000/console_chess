require "spec_helper"

module ConsoleChess

  describe Session do
    let (:fake_printer) {instance_double( Printer, :print => true)}
    let (:fake_reader) {instance_double( Reader, :read => true )}
    let (:fake_board) {instance_double( Board )}
    let (:session) {Session.new(fake_printer, fake_reader, fake_board)}

    it "greets user" do
      allow(fake_board).to receive(:print_board)
      allow(fake_board).to receive(:winner?).and_return(true)
      allow(fake_reader).to receive(:read).and_return("Pa1")
      session.play

      expect(fake_printer).to have_received(:print).with("Welcome to ConsoleChess!")
    end

    it "prints the board" do
      allow(fake_printer).to receive(:print).with("Welcome to ConsoleChess!")
      allow(fake_board).to receive(:print_board)
      allow(fake_board).to receive(:winner?).and_return(true)
      allow(fake_reader).to receive(:read).and_return("Pa1")
      session.play

      expect(fake_board).to have_received(:print_board)
    end

    it "prompts the current user for a move" do
      session.print_turn

      expect(fake_printer).to have_received(:print).with("White's turn:")
    end 

    it "takes turns" do
      expect(session.take_turn).to eql("White")
      expect(session.take_turn).to eql("Black")
      expect(session.take_turn).to eql("White")
      expect(session.take_turn).to eql("Black")
    end

    it "prompts a user for a move" do
      allow(fake_reader).to receive(:read).and_return("Pa1")
      session.get_move("White")

      expect(fake_printer).to have_received(:print).with("White's turn:")
    end

    it "gets a move from the user" do
      allow(fake_printer).to receive(:print).with("White's turn:")
      allow(fake_reader).to receive(:read).and_return("Pa1")
      session.get_move("White")

      expect(fake_reader).to have_received(:read)
    end

    it "rejects an invalid move" do
      allow(fake_printer).to receive(:print).with("White's turn:")
      allow(fake_reader).to receive(:read).and_return("blurple", "Pa1")
      session.get_move("White")

      expect(fake_printer).to have_received(:print).with("Not a valid move")
    end

    it "returns the user-entered move" do
      allow(fake_printer).to receive(:print).with("White's turn:")
      allow(fake_reader).to receive(:read).and_return("Pa1")

      expect(session.get_move("White")).to eq("Pa1")
    end

  end
end