require 'spec_helper'
require 'nmax/populate'

describe Nmax::Populate do
  let(:text) { File.open("#{fixtures_path}/file.txt") }
  let(:num) { 5 }
  let(:populate) { described_class.new(text, num) }
  let(:big_int) { ('1' + '0' * 999).to_i }

  describe '#call' do
    context 'when text is empty' do
      let(:text) { File.open("#{fixtures_path}/empty_file.txt") }

      it { expect(populate.call).to be_empty }
    end

    context 'when num is zero' do
      let(:num) { 0 }

      it { expect(populate.call).to be_nil }
    end

    context 'when num is 5' do
      it { expect(populate.call).to eq([big_int, 324324, 13213, 10000, 5000]) }
    end

    context 'when num is 7' do
      let(:num) { 7 }

      it { expect(populate.call).to eq([big_int, 324324, 13213, 10000, 5000, 5000, 1000]) }
    end

    context 'when num is 10000' do
      let(:num) { 10000 }

      it do
        expect(populate.call).to eq([
          big_int, 324324, 13213, 10000, 5000, 5000, 1000, 1000, 500, 400, 300, 200, 100, 5, 4, 3, 1, 0
        ])
      end
    end
  end
end
