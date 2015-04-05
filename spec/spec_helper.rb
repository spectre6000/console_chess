require "rspec"
require "console_chess"

Dir[File.join(File.dirname(__FILE__), "../lib/console_chess.rb")]
  .each { |f| require f }
