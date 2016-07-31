require_relative 'dicegen'
require_relative 'random_word_service'
require_relative 'password_file_loader'

class Main

  def main
    filename = ARGV[0]
    num_of_phrases = ARGV[1]
    num_of_passwords = ARGV[2]
    file = File.new(filename)
    password_file_loader = PasswordFileLoader.new(file)
    random_word_service = RandomWordService.new(password_file_loader)
    generator = Dicegen.new(random_word_service)
    puts generator.generate(num_of_phrases, num_of_passwords)
  end

  main = Main.new
  main.main

end