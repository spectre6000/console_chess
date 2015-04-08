require "spec_helper"

module ConsoleChess

  describe Session do
    let (:fake_printer) {instance_double( Printer, :print => true)}
    let (:fake_reader) {instance_double( Reader )}
    let (:fake_board) {instance_double( Board )}
    let (:session) {Session.new(fake_printer, fake_reader, fake_board)}

    it "greets user" do
      allow(fake_board).to receive(:winner).and_return(true)
      session.play

      expect(fake_printer).to have_received(:print).with("Welcome to ConsoleChess!")
    end

    it "prompts the current user for a move" do
      allow(fake_printer).to receive(:print).with("Welcome to ConsoleChess!")
      allow(fake_board).to receive(:winner).and_return(true)
      session.play

      expect(fake_printer).to have_received(:print).with("White's turn:")
    end 

    it "takes turns" do
      expect(session.turn).to eql("White")
      session.take_turn
      expect(session.turn).to eql("Black")
      session.take_turn
      expect(session.turn).to eql("White")
      session.take_turn
      expect(session.turn).to eql("Black")
    end

    it "prompts a user for a move" do
      session.get_move("White")
      expect(fake_printer).to have_received(:print).with("White's turn:")
    end

  end
end