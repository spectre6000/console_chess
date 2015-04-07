require "spec_helper"

module ConsoleChess
  describe Printer do
    let (:fake_stdout) {double("$STDOUT", :puts => true, :print => true)}
    let (:printer) {Printer.new(fake_stdout)}

    it "prints a provided input" do
      printer.print("Hello")

      expect(fake_stdout).to have_received(:puts).with("Hello")
    end

    it "clears the screen" do
      printer.clear_screen

      expect(fake_stdout).to have_received(:print).with("\e[H\e[2J")
    end
  end
end
