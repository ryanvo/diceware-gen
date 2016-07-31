require 'net/http'
require 'uri'
require_relative 'password_file_loader'

class RandomWordService

  def initialize(password_file_loader)
    @password_file_loader = password_file_loader
    @hashmap = password_file_loader.generate_hash
  end

  def new_word
    get_word(random_number)
  end

  def get_word(id_number)
    @hashmap[id_number.to_s.to_sym].to_s
  end

  def random_number
    uri = URI('https://www.random.org/integers/')

    params = {:num => 5, :min => 1, :max => 6, :col => 5, :base => 10, :format => 'plain', :rnd => 'new'}

    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    response.body.to_s.gsub!(/\s/, '') if response.is_a?(Net::HTTPSuccess)
  end

end