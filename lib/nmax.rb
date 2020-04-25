require 'nmax/version'

module Nmax
  def self.fixtures_path
    File.join(File.dirname(__dir__), 'spec/fixtures')
  end
end
