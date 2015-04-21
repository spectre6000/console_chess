module ConsoleChess
  class Reader
    def initialize(input = $stdin)
      @input = input
    end

    def read
      @input.gets.chomp
    end
  end
end