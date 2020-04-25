require 'nmax/populate'

module Nmax
  class Processor
    def self.call(text, num)
      raise ArgumentError if num.to_s.empty?
      
      Nmax::Populate.new(text, num).call
    end
  end
end
