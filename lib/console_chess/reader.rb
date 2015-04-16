module ConsoleChess
  class Reader
    def initialize(input = $stdin)
      @input = input
    end

    def read
      @input.gets
    end
  end
end