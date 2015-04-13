require "spec_helper.rb"

module ConsoleChess
  describe Space do
    let (:space) {Space.new("a", "6")}

    it "initializes with the correct token" do
      expect(space.token).to eql("_")
    end

    it "initializes with the correct position" do
      expect(space.position).to eql("a6")
    end 
  end
end