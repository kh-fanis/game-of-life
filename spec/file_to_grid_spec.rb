require_relative 'spec_helper.rb'

require 'digest'

describe FileToGrid do
  it 'should convert matrix inside file to grid' do
    grid = FileToGrid.convert 'examples/example_one.txt'

    md5 = Digest::MD5.hexdigest(grid.cells.flatten.map { |cell| cell.alive? ? 1 : 0 }.to_s)

    expect(md5).to eql '6b6ff4bb78a20d3e75ab61d0c8370dcf'
  end

  it 'should convert matrix string to grid' do
    grid = FileToGrid.string_to_grid("     \n     \n *** \n     \n     ")
    expect(grid.class).to be Grid
  end

  it 'should correctly convert string matrix to grid' do
    grid = FileToGrid.string_to_grid("0011\n0011\n0011\n0011", '1')

    0.upto(3) do |col|
      [0, 1].each { |row| expect(grid.cell_at(col, row)).to be_dead  }
      [2, 3].each { |row| expect(grid.cell_at(col, row)).to be_alive }
    end
  end

  it 'should return postion of matrix' do
    expect(FileToGrid.position_of("     \n     \n *** \n     \n     ")).to eql [5, 5]
  end
end
