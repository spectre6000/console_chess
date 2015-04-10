module ConsoleChess
  class Printer
    def initialize(out = $stdout)
      @out = out
    end

    def print(output)
      @out.puts output
    end

    def clear_screen
      @out.puts "\e[H\e[2J"
    end
  end
end