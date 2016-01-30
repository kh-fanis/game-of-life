class Cell
  attr_accessor :grid, :x, :y

  def initialize(grid, x, y, state = false)
    @grid, @x, @y, @state = grid, x, y, state
  end

  def alive?
    @state
  end

  def dead?
    !@state
  end
end
