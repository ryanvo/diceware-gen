class Main

  def main
    filename = ARGV[0]
    num_of_phrases = ARGV[1]
    num_of_passwords = ARGV[2]
    password_file_loader = PasswordFileLoader.new(filename)
    random_word_service = RandomWordService.new(password_file_loader)
    generator = Dicegen.new(random_word_service)
    generator.generate(num_of_phrases, num_of_passwords)
  end

  main

end