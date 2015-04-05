require_relative "../../lib/console_chess"

module ConsoleChess
  describe VERSION do
    it "knows the correct version" do
      expect(VERSION).to eq("0.0.1")
    end 
  end
end