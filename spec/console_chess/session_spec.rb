require "spec_helper"

module ConsoleChess

  describe Session do
    let (:fake_printer) {instance_double( Printer, :print => true)}
    let (:fake_reader) {instance_double( Reader, :read => true )}
    let (:fake_board) {instance_double( Board )}
    let (:session) {Session.new(fake_printer, fake_reader, fake_board)}

    def print(message); allow(fake_printer).to receive(:print).with(message); end
    def print_board; allow(fake_board).to receive(:print_board); end
    def piece_in_place?; allow(fake_board).to receive(:piece_in_place?).and_return(true); end
    def legal_move?; allow(fake_board).to receive(:legal_move?).and_return(true); end
    def winner?; allow(fake_board).to receive(:winner?).and_return(true); end
    def read(*messages); allow(fake_reader).to receive(:read).and_return(*messages); end
    def commit_move; allow(fake_board).to receive(:commit_move).and_return(true); end
    def play; session.play; end
    def get_move(turn); session.get_move(turn); end

    it "greets user" do
      print_board
      piece_in_place?
      legal_move?
      winner?
      read("Pa2 to _a3")
      commit_move

      play

      expect(fake_printer).to have_received(:print).with("Welcome to ConsoleChess!")
    end

    it "prints the board" do
      print("Welcome to ConsoleChess!")
      print_board
      piece_in_place?
      legal_move?
      winner?
      read("Pa2 to Pa3")
      commit_move

      play

      expect(fake_board).to have_received(:print_board)
    end

    it "prompts the current user for a move" do
      session.print_turn

      expect(fake_printer).to have_received(:print).with("White's turn:")
    end 

    it "takes turns" do
      spec_array = ["Black", "White", "Black", "White"]
      
      spec_array.each {|x| expect(session.take_turn).to eql(x)}
    end

    it "makes sure players can only move their own pieces" do
      [["ph7", false], ["Pa7", true]].each { |x, y| expect(session.correct_player?(x)).to eql(y)}
    end

    it "prompts a user for a move" do
      read("Pa2 to _a3")
      piece_in_place?
      legal_move?
      get_move("White")

      expect(fake_printer).to have_received(:print).with("White's turn:")
    end

    it "gets a move from the user" do
      print("White's turn:")
      read("Pa2 to _a3")
      piece_in_place?
      legal_move?
      get_move("White")

      expect(fake_reader).to have_received(:read)
    end

    it "rejects an invalid move with nonsensical start/target" do
      print("White's turn:")
      read("blurple to Pa3", "Pa2 to blurple", "Pa2 to _a3")
      piece_in_place?
      legal_move?
      get_move("White")

      expect(fake_printer).to have_received(:print).with("Not a valid move").twice
    end

    it "recognizes a valid move" do
      piece_in_place?
      legal_move?

      expect(session.valid_move?("Pa2 to _a3")).to eql(true)
    end

    it "recognizes a valid start call_sign" do
      spec_array = ["Pa1", "pb2", "Rc3", "rd4", "Ne5", "nf6", "Bg7", "bh8", "qb1", "Kc2"]
      
      spec_array.each do |x|
        expect(session.valid_start_call_sign?(x)).to eql(true)
      end
    end

    it "recognizes an invalid start call_sign" do
      spec_array = ["_e4", "Qa9", "ki3", ".d5", "fe6"]
      
      spec_array.each do |x|
        expect(session.valid_start_call_sign?(x)).to eql(false)
      end
    end

     it "recognizes a valid target call_sign" do
      spec_array = ["Pa1", "pb2", "Rc3", "rd4", "Ne5", "nf6", "Bg7", "bh8", "qb1", "Kc2", "_e4"]
      
      spec_array.each do |x|
        expect(session.valid_target_call_sign?(x)).to eql(true)
      end
    end

    it "recognizes an invalid target call_sign" do
      spec_array = ["Qa9", "ki3", ".d5", "fe6"]
      
      spec_array.each do |x|
        expect(session.valid_target_call_sign?(x)).to eql(false)
      end
    end

    it "rejects an invalid move attempting to move empty space" do
      print("White's turn:")
      read("_a3 to Pa4", "Pa2 to Pa3")
      piece_in_place?
      legal_move?
      get_move("White")

      expect(fake_printer).to have_received(:print).with("Not a valid move")
    end

    it "accpets en passant capture as valid move" do
      board = Board.new 
      sessionii = Session.new(fake_printer, fake_reader, board)

      ["Pa2 to _a3", "pb7 to _b5", "Pa3 to _a4", "pb5 to _b4", "Pa4 to _a5",
      "pb4 to _b3"].each {|x| board.commit_move(x) }
      
      expect(sessionii.valid_move?("Pc2 to _b4")).to eql(true)
    end

    it "returns the user-entered move" do
      print("White's turn:")
      read("Pa2 to _a3")
      piece_in_place?
      legal_move?

      expect(session.get_move("White")).to eq("Pa2 to _a3")
    end
  end
end