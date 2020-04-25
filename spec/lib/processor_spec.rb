require 'spec_helper'
require 'nmax/processor'

describe Nmax::Processor do
  let(:text) { File.open("#{fixtures_path}/empty_file.txt") }
  let(:num) { nil }

  describe '#initialize' do
    context 'when num is blank' do
      it { expect { described_class.call(text, num) }.to raise_error(ArgumentError) }      
    end
  end

  describe '#call' do
    let(:num) { 1 }
    let(:populate_mock) { double('Nmax::Populate') }

    before do
      allow(Nmax::Populate).to receive(:new).with(text, num).and_return(populate_mock)
      allow(populate_mock).to receive(:call)
      described_class.call(text, num)
    end

    it { expect(populate_mock).to have_received(:call) }
  end
end
