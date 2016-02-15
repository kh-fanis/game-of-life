require 'digest'
require_relative 'cell.rb'

class Grid
  attr_accessor :cells

  @@DEFAULT_COLUMS = 8
  @@DEFAULT_ROWS   = 8

  def initialize columns = @@DEFAULT_COLUMS, rows = @@DEFAULT_ROWS
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

  def iterate!
    cells_to_toggle = []

    @cells.flatten.each do |cell|
      living_neighbors_count = cell.living_neighbors.count

      if cell.alive? && (living_neighbors_count < 2 || living_neighbors_count > 3)
        cells_to_toggle.push cell
      elsif cell.dead? && living_neighbors_count == 3
        cells_to_toggle.push cell
      end
    end

    cells_to_toggle.each { |cell| cell.toggle! }

    self
  end

  def all_dead?
    @cells.flatten.select { |cell| cell.alive? }.size == 0
  end
end
