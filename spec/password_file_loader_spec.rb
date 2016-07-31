require 'rspec'
require_relative '../password_file_loader.rb'

describe PasswordFileLoader do

  let(:file) { double('file') }
  let(:underTest) { PasswordFileLoader.new(file) }

  describe '.create_pair' do
    it 'should split the string into a pair' do
      expect(underTest.create_pair('11131	aide')).to eql(['11131', 'aide'])
    end
  end

  describe '.generate_hash' do
    context 'for each line' do
      it 'should add a new pair to the hash' do
        allow(file).to receive(:each_line).and_yield('11131  aide').and_yield('11132 aow')
        expect(underTest).to receive(:create_pair).exactly(2).times.and_return([11131, 'aide'], [11132, 'aow'])

        result = underTest.generate_hash

        expect(result).to include(:'11131' => :aide)
        expect(result).to include(:'11132' => :aow)
        expect(result.size).to eql(2)
      end
    end
  end

end