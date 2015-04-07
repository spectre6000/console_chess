require "spec_helper"

module ConsoleChess

  describe Session do
    let (:fake_printer) {instance_double( Printer, :print => true)}
    let (:fake_reader) {instance_double( Reader )}
    let (:fake_board) {instance_double( Board )}
    let (:session) {Session.new(fake_printer, fake_reader, fake_board)}

    it "greets user" do
      allow(fake_board).to receive(:continue?).and_return(false)
      session.play

      expect(fake_printer).to have_received(:print).with("Welcome to ConsoleChess!")
    end

    it "prompts the current user for a move" do
      expect(fake_printer).to receive(:print).with("Welcome to ConsoleChess!")
      allow(fake_board).to receive(:continue?).and_return(true)
      allow(fake_board).to receive(:print_board)
      allow(fake_board).to receive(:continue?).and_return(false)
      session.play

  
      expect(fake_printer).to have_received(:print).with("White's move:")
    end 
  end
end