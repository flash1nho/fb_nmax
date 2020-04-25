module Nmax
  class Populate
    MAX_INTEGER_LENGTH = 415
    BATCH_SIZE = 2000
    INTEGER_FORMAT = /\d+/.freeze

    def initialize(text, num)
      @text = text
      @num = num.to_i
    end

    def call
      return if @num.zero?

      result = []

      @text.each_slice(BATCH_SIZE) do |lines|
        extract_ary = lines.
          flat_map { |line| line.scan(INTEGER_FORMAT) }.
          map(&:to_i).
          reject { |i| i.size > MAX_INTEGER_LENGTH }

        next if extract_ary.empty?

        result << extract_ary
      end

      result.flatten.sort.reverse.take(@num)
    end
  end
end
