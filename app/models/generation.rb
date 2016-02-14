require 'digest'

class Generation
  attr_accessor :number, :grid
  attr_reader :md5_hash

  def initialize number, grid
    @number, @grid, @md5_hash = number, grid, grid.to_md5
  end

  def grid= grid
    @md5_hash = grid.to_md5
  end

  def == generation
    @md5_hash == generation.md5_hash
  end
end