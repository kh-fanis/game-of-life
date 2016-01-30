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

  it 'should return neighbors of the cell' do
      expect(grid.cell_at(0, 0).neighbors.map { |cell| [cell.x, cell.y] }).to eql [[7, 7], [7, 0], [7, 1], [0, 7], [0, 1], [1, 7], [1, 0], [1, 1]]
  end

  it 'should return neighbors which are alive' do
    cell_to_test_living_neighbors = grid.cell_at 5, 5
    cell_to_test_living_neighbors.revive!
    living_neighbors = grid.cell_at(5, 4).living_neighbors
    expect(living_neighbors).to eql [cell_to_test_living_neighbors]
  end

  it 'should have to_s method' do
    expect(dead_cell.to_s).to eql " "
    expect(alive_cell.to_s).to eql "*"
  end

  it 'should change state' do
    dead_cell.change_state
    expect(dead_cell).to be_alive
  end
end
