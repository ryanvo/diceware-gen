class PasswordFileLoader

  def initialize(file)
    @file = file
  end

  def generate_hash()
    map = {}
    @file.each_line do |line|
      pair = create_pair(line)
      map.store(pair[0].to_s.to_sym, pair[1].to_sym)
    end
    map
  end

  def create_pair(line)
    first = line[0..4]
    second = line[6..-1]
    [first, second]
  end

end