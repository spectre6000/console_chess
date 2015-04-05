module ConsoleChess
  class Reader
    def initialize(input = $STDIN)
      @input = input
    end

    def read
      @input.gets
    end
  end
end