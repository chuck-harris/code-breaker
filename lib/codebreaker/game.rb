module Codebreaker

  class Game

    def initialize(o_output)
      @o_output = o_output
    end

    def start(secret)
      @secret = secret
      @o_output.puts 'Welcome to Codebreaker!'
      @o_output.puts 'Enter guess:'
    end

    def guess(guess)
      marker = Marker.new(@secret, guess)
      @o_output.puts '+' * marker.exact_match_count + '-' * marker.number_match_count
    end
  end
end