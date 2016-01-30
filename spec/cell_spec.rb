require_relative 'spec_helper.rb'

describe Cell do
  let(grid) { Grid.new }
  let(dead_cell) { Cell.new grid, 0, 0 }
  let(alive_cell) { Cell.new grid, 0, 0, true }

  it 'should a part of grid' do
    expect(dead_cell.grid).to be_equal grid
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
    expect(dead_cell.revive!).to be_alive
  end

  it 'should kill alive cell' do
    expect(alive_cell.kill!).to be_dead
  end
end
