require_relative 'cell.rb'

class Grid
  attr_accessor :cells

  def initialize columns = 8, rows = 8
    @cells = []
    (0...columns).each do |x|
      @cells.push []
      (0...rows).each do |y|
        @cells[x].push Cell.new(self, x, y)
      end
    end
  end

  def cell_at x, y
    @cells[x][y]
  end

  def to_s
    @cells.map do |arr|
      arr.map do |cell|
	cell.to_s
      end.join
    end.join "\n"
  end

  def iterate!
    cells_to_change_state = []

    @cells.flatten.each do |cell|
      living_neighbors_count = cell.living_neighbors.count
      if cell.alive? && (living_neighbors_count < 2 || living_neighbors_count > 3)
        cells_to_change_state.push cell
      elsif cell.dead? && living_neighbors_count == 3
        cells_to_change_state.push cell
      end
    end

    cells_to_change_state.each { |cell| cell.change_state! }
    cells_to_change_state
  end
end
