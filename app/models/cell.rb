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

  def change_state!
    @state = !@state
  end

  def neighbors
    next_x, next_y = x + 1, y + 1
    next_x = 0 if x == @grid.cells.length - 1
    next_y = 0 if y == @grid.cells[0].length - 1
    [
      @grid.cell_at(x - 1, y - 1),
      @grid.cell_at(x - 1, y),
      @grid.cell_at(x - 1, next_y),

      @grid.cell_at(x, y - 1),
      @grid.cell_at(x, next_y),

      @grid.cell_at(next_x, y - 1),
      @grid.cell_at(next_x, y),
      @grid.cell_at(next_x, next_y)
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
