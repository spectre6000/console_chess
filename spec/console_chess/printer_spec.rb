require "spec_helper"

module ConsoleChess
  describe Printer do
    it "says 'Hello'" do
      fake_stdout = double("$STDOUT", :puts => true)
      printer = Printer.new(fake_stdout)
      
      printer.print("Hello")

      expect(fake_stdout).to have_received(:puts).with("Hello")
    end
  end
end
