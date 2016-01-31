require_relative 'spec_helper.rb'

describe FileToGrid do
  it 'should convert matrix inside file to grid' do
    grid = FileToGrid.convert 'examples/example_one.txt'
    expect(grid.to_s).to eql "     \n     \n *** \n     \n     "
  end

  it 'should convert matrix string to grid' do
    expect(FileToGrid.string_to_grid("     \n     \n *** \n     \n     ").class).to be Grid
  end

  it 'should return postion of matrix' do
    expect(FileToGrid.position_of "     \n     \n *** \n     \n     ").to eql [5, 5]
  end
end
