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

  def revive!
    @state = true
  end

  def kill!
    @state = false
  end

  def neighbors
    [
      @grid.cell_at(x - 1, y - 1),
      @grid.cell_at(x - 1, y),
      @grid.cell_at(x - 1, y + 1),

      @grid.cell_at(x, y - 1),
      @grid.cell_at(x, y + 1),

      @grid.cell_at(x + 1, y - 1),
      @grid.cell_at(x + 1, y),
      @grid.cell_at(x + 1, y + 1)
    ]
  end

  def living_neighbors
    neighbors.select(&:alive?)
  end

  def to_s
    if alive?
      "*"
    else
      " "
    end
  end
end
