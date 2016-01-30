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
end
