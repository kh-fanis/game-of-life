require_relative 'spec_helper.rb'

describe Cell do
  let(:grid) { Grid.new }
  let(:dead_cell) { Cell.new grid, 0, 0 }
  let(:alive_cell) { Cell.new grid, 1, 2, true }

  it 'should a part of grid' do
    expect(dead_cell.grid).to be_equal grid
  end

  it 'should have correct position' do
    expect(alive_cell.x).to eql 1
    expect(alive_cell.y).to eql 2
  end

  it 'should be alive' do
    expect(alive_cell).to be_alive
    expect(alive_cell).not_to be_dead
  end

  it 'should be dead' do
    expect(dead_cell).to be_dead
    expect(dead_cell).not_to be_alive
  end

  it 'should revive dead cell' do
    dead_cell.revive!
    expect(dead_cell).to be_alive
  end

  it 'should kill alive cell' do
    alive_cell.kill!
    expect(alive_cell).to be_dead
  end

  context 'testing real example' do
    before(:all) do
      grid = Grid.new
      grid.cells = []
      5.times do |col|
        grid.cells.push []
        5.times do |row|
          grid.cells[col].push Cell.new(self, col, row)
        end
      end
      (1...4).each { |i| grid.cells[2][i].revive! }
    end

    it 'should return neighbors of the cell' do
      expect(grid.cell_at(0, 0).neighbors.map { |cell| [cell.x, cell.y] }).to eql [[4, 4], [0, 4], [1, 4], [4, 0], [1, 0], [4, 1], [0, 1], [1, 1]]
    end
  end
end
