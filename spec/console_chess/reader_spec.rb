require "spec_helper"

module ConsoleChess
  describe Reader do
    it "reads user input" do
      fake_stdin = double("$STDIN", :gets => true)
      reader = Reader.new(fake_stdin)
      reader.read
      expect(fake_stdin).to have_received(:gets)
    end
  end
end