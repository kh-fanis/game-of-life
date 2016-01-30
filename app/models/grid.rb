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
    cells_to_kill, cells_to_revive = [], []
    @cells.flatten.each do |cell|
      if cell.alive? && cell.living_neighbors < 2 && cell.living_neighbors > 3
        cells_to_kill.push cell
      elsif cell.dead? && cell.living_neighbors == 3
        cells_to_revive.push cell
      end
    end
  end
end
