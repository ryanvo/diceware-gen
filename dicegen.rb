class Dicegen

  def initialize(random_word_service)
    @random_word_service = random_word_service
  end

  def generate(num_of_phrases, num_of_passwords)
    raise ArgumentError, 'num_of_phrases must be > 0' unless num_of_phrases > 0
    raise ArgumentError, 'num_of_passwords must be > 0' unless num_of_passwords > 0

    passes = []
    num_of_passwords.times do
      passes.push(new_pass(num_of_phrases))
    end
    passes
  end

  def new_pass(num_of_phrases)
    password = ''
    num_of_phrases.times do
      password << get_random_word.to_s << ' '
    end
    password.chop
  end

  def get_random_word
    @random_word_service.random_word
  end

end