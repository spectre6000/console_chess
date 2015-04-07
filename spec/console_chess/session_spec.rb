require "spec_helper"

module ConsoleChess

  describe Session do
    let (:fake_printer) {instance_double( Printer, :print => true)}
    let (:fake_reader) {instance_double( Reader )}
    let (:fake_board) {instance_double( Board )}


    it "greets user" do
      expect(fake_printer).to receive(:print).with("Welcome to ConsoleChess!")
      Session.new(fake_printer, fake_reader, fake_board).play
    end
  end
end