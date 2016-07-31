class PasswordFileLoader

  def initialize(file)
    @file = file
  end

  def generate_hash()
    map = {}
    line = get_line
    pair = create_pair(line)
    map.store(pair[0], pair[1])
    map
  end

  def get_line
    @file.readline
  end

  def create_pair(line)
    first = line[0..4]
    second = line[6..-1]
    [first.to_s.to_sym, second.to_sym]
  end

end