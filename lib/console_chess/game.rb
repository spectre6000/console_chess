module ConsoleChess
  class Game
    def initialize(printer)
      @printer = printer
    end

    def play
      @printer.print("Hello")
    end
  end
end