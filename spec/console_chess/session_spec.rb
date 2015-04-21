require "spec_helper"

module ConsoleChess

  describe Session do
    let (:fake_printer) {instance_double( Printer, :print => true)}
    let (:fake_reader) {instance_double( Reader, :read => true )}
    let (:fake_board) {instance_double( Board )}
    let (:session) {Session.new(fake_printer, fake_reader, fake_board)}

    it "greets user" do
      allow(fake_board).to receive(:print_board)
      allow(fake_board).to receive(:piece_in_place?).and_return(true)
      allow(fake_board).to receive(:legal_move?).and_return(true)
      allow(fake_board).to receive(:winner?).and_return(true)
      allow(fake_reader).to receive(:read).and_return("Pa2 to Pa3")
      session.play

      expect(fake_printer).to have_received(:print).with("Welcome to ConsoleChess!")
    end

    it "prints the board" do
      allow(fake_printer).to receive(:print).with("Welcome to ConsoleChess!")
      allow(fake_board).to receive(:print_board)
      allow(fake_board).to receive(:piece_in_place?).and_return(true)
      allow(fake_board).to receive(:legal_move?).and_return(true)
      allow(fake_board).to receive(:winner?).and_return(true)
      allow(fake_reader).to receive(:read).and_return("Pa2 to Pa3")
      session.play

      expect(fake_board).to have_received(:print_board)
    end

    it "prompts the current user for a move" do
      session.print_turn

      expect(fake_printer).to have_received(:print).with("White's turn:")
    end 

    it "takes turns" do
      expect(session.take_turn).to eql("White")
      expect(session.take_turn).to eql("Black")
      expect(session.take_turn).to eql("White")
      expect(session.take_turn).to eql("Black")
    end

    it "prompts a user for a move" do
      allow(fake_reader).to receive(:read).and_return("Pa2 to Pa3")
      allow(fake_board).to receive(:piece_in_place?).and_return(true)
      allow(fake_board).to receive(:legal_move?).and_return(true)
      session.get_move("White")

      expect(fake_printer).to have_received(:print).with("White's turn:")
    end

    it "gets a move from the user" do
      allow(fake_printer).to receive(:print).with("White's turn:")
      allow(fake_reader).to receive(:read).and_return("Pa2 to _a3")
      allow(fake_board).to receive(:piece_in_place?).and_return(true)
      allow(fake_board).to receive(:legal_move?).and_return(true)
      session.get_move("White")

      expect(fake_reader).to have_received(:read)
    end

    it "rejects an invalid move with nonsensical start/target" do
      allow(fake_printer).to receive(:print).with("White's turn:")
      allow(fake_reader).to receive(:read).and_return("blurple to Pa3", "Pa2 to blurple", "Pa2 to _a3")
      allow(fake_board).to receive(:piece_in_place?).and_return(true)
      allow(fake_board).to receive(:legal_move?).and_return(true)
      session.get_move("White")

      expect(fake_printer).to have_received(:print).with("Not a valid move").twice
    end

    it "recognizes a valid format" do
      expect(session.valid_format?("Pa2", "_a3", "Pa2 to _a3")).to eql(true)
    end

    it "recognizes a valid move" do
      allow(fake_board).to receive(:piece_in_place?).and_return(true)
      allow(fake_board).to receive(:legal_move?).and_return(true)
      expect(session.valid_move?("Pa2 to _a3")).to eql(true)
    end

    it "recognizes a valid start call_sign" do
      good_pieces = ["Pa1", "pb2", "Rc3", "rd4", "Ne5", "nf6", "Bg7", "bh8", "qb1", "Kc2"]
      good_pieces.each do |x|
        expect(session.valid_start_call_sign?(x)).to eql(true)
      end
    end

    it "recognizes an invalid start call_sign" do
      bad_pieces = ["_e4", "Qa9", "ki3", ".d5", "fe6"]
      bad_pieces.each do |x|
        expect(session.valid_start_call_sign?(x)).to eql(false)
      end
    end

     it "recognizes a valid target call_sign" do
      good_pieces = ["Pa1", "pb2", "Rc3", "rd4", "Ne5", "nf6", "Bg7", "bh8", "qb1", "Kc2", "_e4"]
      good_pieces.each do |x|
        expect(session.valid_target_call_sign?(x)).to eql(true)
      end
    end

    it "recognizes an invalid target call_sign" do
      bad_pieces = ["Qa9", "ki3", ".d5", "fe6"]
      bad_pieces.each do |x|
        expect(session.valid_target_call_sign?(x)).to eql(false)
      end
    end

    it "rejects an invalid move attempting to move empty space" do
      allow(fake_printer).to receive(:print).with("White's turn:")
      allow(fake_reader).to receive(:read).and_return("_a3 to Pa4", "Pa2 to Pa3")
      allow(fake_board).to receive(:piece_in_place?).and_return(true)
      allow(fake_board).to receive(:legal_move?).and_return(true)
      session.get_move("White")

      expect(fake_printer).to have_received(:print).with("Not a valid move")
    end

    it "returns the user-entered move" do
      allow(fake_printer).to receive(:print).with("White's turn:")
      allow(fake_reader).to receive(:read).and_return("Pa2 to Pa3")
      allow(fake_board).to receive(:piece_in_place?).and_return(true)
      allow(fake_board).to receive(:legal_move?).and_return(true)

      expect(session.get_move("White")).to eq("Pa2 to Pa3")
    end
  end
end