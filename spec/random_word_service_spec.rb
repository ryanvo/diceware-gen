require 'rspec'
require_relative '../random_word_service'


describe RandomWordService do

  let(:sample_hash) { {:'12345' => :foo, :'54321' => :bar } }
  let(:password_file_loader) {double("PasswordFileLoader", :generate_hash => sample_hash)}
  let(:underTest) {RandomWordService.new(password_file_loader)}

  describe '.new_word' do
    it 'should return the word at a random id' do
      allow(underTest).to receive(:get_word).and_return("foo")
      expect(underTest).to receive(:random_number).exactly(1).times
      expect(underTest.new_word).to eq("foo")
    end
  end

  describe '.get_word' do
    it 'should return the word with the given id' do
      expect(underTest.get_word(12345)).to eq("foo")
      expect(underTest.get_word(54321)).to eq("bar")
    end
  end

  describe '.random_number' do
    it 'should return a 5-digit number' do
      expect(underTest.random_number.to_s.size).to eq(5)
    end

    it 'should return digits within a range of 1-6' do
      underTest.random_number.to_s.each_char do |ch|
        expect(ch.to_i).to be > 0
        expect(ch.to_i).to be < 7
      end
    end
  end

end