require 'rspec'
require_relative '../dicegen'

describe Dicegen do

  let(:random_word_service) { double('RandomWordService', :random_word => "random_word") }
  let(:dg) { Dicegen.new(random_word_service) }

  describe '.generate' do
    context 'when number of passphrases to generate is 0' do
      it 'should throw an error' do
        expect { dg.generate(0, rand(100)) }.to raise_error(ArgumentError)
      end
    end

    context 'when number of passwords to generate is 0' do
      it 'should throw an error' do
        expect { dg.generate(rand(100), 0) }.to raise_error(ArgumentError)
      end
    end

    context 'when number of passphrases is n' do
      it 'should generate passwords with n=1 phrases' do
        n_phrases = rand(1..100)
        n_passwords = rand(1..100)
        expect(dg).to receive(:new_pass).with(n_phrases).exactly(n_passwords)
        dg.generate(n_phrases, n_passwords)

      end
    end

    context 'when number of passwords is n' do
      it 'should generate n=1 passwords' do
        n = rand(1..100)
        expect(dg).to receive(:new_pass).exactly(n).times
        dg.generate(rand(1..100), n)
      end
    end

  end

  describe '.new_pass' do
    it 'should generate a new password with n phrases' do
      n_phrases = rand(1..100)
      expect(dg).to receive(:get_random_word).exactly(n_phrases)
      expect(dg.new_pass(n_phrases).count(' ')).to eq(n_phrases - 1)
    end
  end

  describe '.get_random_word' do
    it 'should generate a random word' do
      expect(random_word_service).to receive(:random_word).exactly(1).times
      dg.get_random_word
    end
  end

end