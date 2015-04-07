require "spec_helper.rb"

module ConsoleChess
  describe King do
      let (:bking) {King.new("e", "black")}
      let (:wking) {King.new("e", "white")}

    it "initializes with the correct 'color'" do
      expect(bking.token).to eql("k")
      expect(wking.token).to eql("K")
    end

    it "initializes with the correct position" do
      expect(bking.position).to eql("e8")
      expect(wking.position).to eql("e1")
    end

  end
end