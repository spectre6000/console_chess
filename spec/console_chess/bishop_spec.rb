require "spec_helper"

module ConsoleChess
  describe Bishop do
    let (:bbishop) {Bishop.new("c", "Black")}
    let (:wbishop) {Bishop.new("f", "White")}

    it "initializes with the correct 'color'" do
      expect(bbishop.token).to eql("b")
      expect(wbishop.token).to eql("B")
    end

    it "initializes with the correct position" do
      expect(bbishop.position).to eql("c8")
      expect(wbishop.position).to eql("f1")
    end
  end
end