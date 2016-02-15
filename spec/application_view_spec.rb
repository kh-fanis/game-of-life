require_relative 'spec_helper.rb'

describe ApplicationView do

  it 'should be in inhertance with View class' do
    expect(described_class).to be < View
  end

  context 'should correcty parse objects to view side' do
    let(:grid) { Grid.new(5, 5) }
    let(:generation) { Generation.new grid }
    let(:generation_log) { GenerationLog.new }

    before do
      1.upto(3) { |n| grid.cell_at(2, n).revive! }

      generation_log.add(generation)
    end

    it 'parsing grid to veiw side' do
      expect(ApplicationView.object_to_s(grid)).to eql "     \n     \n *** \n     \n     "
    end

    it 'parsing generation to view side' do
      expect(ApplicationView.object_to_s(generation_log)).to eql '2'
    end
  end
end