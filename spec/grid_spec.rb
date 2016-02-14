require_relative 'spec_helper.rb'

describe Grid do
  let(:grid) { Grid.new }
  let(:cell) { Cell.new grid, 0, 0 }

  context 'inititialized with no attributes' do
    it 'should have cells variable as matrix 8x8' do
      expect(grid.cells.length).to eql 8
      expect(grid.cells[0].length).to eql 8
    end

    it 'should have no alive cells' do
      expect(grid.cells.flatten.all?(&:dead?)).to eql true
    end
  end

  it 'should have cells inside' do
    another_one_cell = Cell.new(grid, 5, 1)

    grid.cells[0][0] = cell
    grid.cells[5][1] = another_one_cell

    expect(grid.cell_at(0, 0)).to eql cell
    expect(grid.cell_at(5, 1)).to eql another_one_cell
  end

  it 'should correctly out the data' do
    grid = Grid.new 3, 3

    grid.cell_at(0, 0).revive!
    grid.cell_at(2, 2).revive!

    expect(grid.to_s).to eql "*  \n   \n  *"
  end

  it 'should generate next iteration' do
    grid = Grid.new 5, 5
    (1...4).each { |i| grid.cell_at(2, i).revive! }

    grid.iterate!
    expect(grid.to_s).to eql "     \n  *  \n  *  \n  *  \n     "

    grid.iterate!
    expect(grid.to_s).to eql "     \n     \n *** \n     \n     "
  end

  it 'should have no alive cells' do
    expect(grid).to be_all_dead
  end

  it 'should have alive cells' do
    grid.cell_at(0, 0).revive!
    expect(grid).not_to be_all_dead
  end
end
