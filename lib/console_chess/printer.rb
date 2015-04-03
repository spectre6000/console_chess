

module ConsoleChess
  class Printer
    def initialize(out = $STDOUT)
      @out = out
    end

    def say_hello
      @out.puts "Hello"
    end
  end
end