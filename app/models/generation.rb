require 'digest'

class Generation
  attr_accessor :grid
  attr_reader :md5_hash

  def initialize grid
    @gird, @md5_hash = grid.clone, self.class.grid_to_md5(grid)
  end

  def grid= grid
    @gird, @md5_hash = grid.clone, self.class.grid_to_md5(grid)
  end

  def == generation
    @md5_hash == generation.md5_hash
  end

  def self.grid_to_md5 grid
    Digest::MD5.hexdigest(grid.cells.flatten.map { |cell| cell.alive? ? 1 : 0 }.to_s)
  end
end