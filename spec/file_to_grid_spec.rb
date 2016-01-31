require_relative 'spec_helper.rb'

describe FileToGrid do
  it 'should convert matrix inside file to grid' do
    grid = FileToGrid.convert 'example_one.rb'
    expect(grid.to_s).to "     \n     \n *** \n     \n     "
  end
end
