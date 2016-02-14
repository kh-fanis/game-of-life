class GenerationLog
  attr_accessor :generations

  def initialize
    @generations = []
  end

  def add generation
    return false if includes? generation
    generations.push generation
    true
  end

  def includes? generation
    generations.select { |gen| gen.md5_hash == generation.md5_hash }.size > 0
  end

  def last_number
    @generations.size
  end
end