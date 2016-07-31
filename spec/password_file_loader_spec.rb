require 'rspec'
require_relative '../password_file_loader.rb'

describe PasswordFileLoader do

  let(:file) { double('file', :readline => @nextline) }
  let(:pfl) { PasswordFileLoader.new(file) }

  describe '.get_line' do
    it 'should return a line' do
      @nextline = 'expected'
      expect(pfl.get_line).to eql(@nextline)
    end
  end

  describe '.create_pair' do
    it 'should split the string into a pair' do
      @nextline = '11131	aide'
      expect(pfl.create_pair(@nextline)).to eql([:'11131', :aide])
    end
  end

  describe '.generate_hash' do

    context 'for each line' do
      it 'should add a new pair to the hash' do
        @nextline = '11131 aide'
        map = pfl.generate_hash()
        expect(map).to include(:"11131" => :aide)
        expect(map.size).to eql(1)
      end
    end

  end

end