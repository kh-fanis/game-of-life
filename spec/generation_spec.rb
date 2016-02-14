require_relative 'spec_helper.rb'

describe Generation do
  let(:grid)  { Grid.new }
  let(:grid2) { Grid.new }
  let(:generation) { generation = Generation.new(grid) }

  before(:each) do
    grid.cell_at(1, 1).revive!

    grid2.cell_at(1, 2).revive!
  end

  context 'md5_hash' do
    before(:each) do
      grid = Grid.new 5, 5
      (1...4).each { |i| grid.cell_at(2, i).revive! }
    end

    it 'should return md5_hash' do
      expect(Generation.grid_to_md5 grid).to eql '5af3d5be88a941c6ea529cb573f4098b'
    end
  end

  it 'should correctly set md5_hash' do
    expect(generation.md5_hash).to eql '5af3d5be88a941c6ea529cb573f4098b'
    generation.grid = grid2
    expect(generation.md5_hash).to eql 'c47d975297f0908668f2588c7c568999'
  end
end