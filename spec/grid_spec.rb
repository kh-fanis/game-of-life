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
      expect(grid.cells.all(&:dead?)).to eql true
    end
  end

  it 'should have cells inside' do
    another_one_cell = Cell.new(grid, 5, 1)

    expect(grid.cell_at(0, 0)).to eql cell
    expect(grid.cell_at(5, 1)).to eql another_one_cell
  end
end
