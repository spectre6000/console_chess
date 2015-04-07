module ConsoleChess
  class Printer
    def initialize(out = $STDOUT)
      @out = out
    end

    def print(output)
      @out.puts output
    end

    def clear_screen
      @out.print "\e[H\e[2J"
    end
  end
end