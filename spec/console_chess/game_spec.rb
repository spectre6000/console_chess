require_relative "../../lib/console_chess"

module ConsoleChess

  describe Game do
    it "tells the printer to say 'Hello'" do
      fake_printer = instance_double(Printer)
      allow(fake_printer).to receive(:print)
      Game.new(fake_printer).play

      expect(fake_printer).to have_received(:print).with("Hello")
    end
    
  end

end