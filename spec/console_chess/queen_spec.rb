require "spec_helper"

module ConsoleChess
  describe Queen do
    let (:bqueen) {Queen.new("d", "black")}
    let (:wqueen) {Queen.new("d", "white")}


    it "initializes with the correct 'color'" do
      expect(bqueen.token).to eql("q")
      expect(wqueen.token).to eql("Q")
    end

    it "initializes with the correct position" do
      expect(bqueen.position).to eql("d8")
      expect(wqueen.position).to eql("d1")
    end
  end
end