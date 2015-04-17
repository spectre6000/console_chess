require "spec_helper"

module ConsoleChess
  describe VERSION do
    it "knows the correct version" do
      expect(VERSION).to eq("0.0.2")
    end 
  end
end