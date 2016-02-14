require 'digest'

class Generation
  attr_accessor :grid
  attr_reader :md5_hash

  def initialize grid
    @gird, @md5_hash = grid.clone, grid.to_md5
  end

  def grid= grid
    @gird, @md5_hash = grid.clone, grid.to_md5
  end

  def == generation
    @md5_hash == generation.md5_hash
  end
end