require "spec_helper"

module ConsoleChess
  describe Reader do
    let (:fake_stdin) {double("$STDIN", :gets => true)}
    let (:reader) {Reader.new(fake_stdin)}

    it "reads user input" do
      reader.read
      expect(fake_stdin).to have_received(:gets)
    end
  end
end