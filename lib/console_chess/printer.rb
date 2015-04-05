

module ConsoleChess
  class Printer
    def initialize(out = $STDOUT)
      @out = out
    end

    def print(output)
      @out.puts output
    end
  end
end