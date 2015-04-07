require "spec_helper.rb"

module ConsoleChess
  describe Space do
    it "initializes with the correct 'color'" do
      space = Space.new

      expect(space.token).to eql("_")
    end
  end
end