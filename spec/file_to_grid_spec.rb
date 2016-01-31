require_relative 'spec_helper.rb'

describe FileToGrid do
  it 'should convert matrix inside file to grid' do
    grid = FileToGrid.convert 'examples/example_one.txt'
    expect(grid.to_s).to "     \n     \n *** \n     \n     "
  end

  it 'should convert matrix string to grid' do
    expect(FileToGrid.string_to_grid("     \n     \n *** \n     \n     ").class).to be Grid
  end
end
