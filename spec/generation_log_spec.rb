require_relative 'spec_helper.rb'

describe GenerationLog do
  let(:generation_log) { GenerationLog.new }
  let(:grid) { Grid.new 5, 5 }

  before do
    1.upto(3) { |i| grid.cell_at(2, i).revive! }
  end

  it 'should include generation yet' do
    expect(generation_log.includes?(Generation.new(grid))).to eql false
    generation_log.add(Generation.new(grid))
    expect(generation_log.includes?(Generation.new(grid))).to eql true
  end

  it 'should add generation to stack' do
    expect(generation_log.add(Generation.new(grid))).to eql true
    expect(generation_log.add(Generation.new(grid.iterate!))).to eql true
    expect(generation_log.add(Generation.new(grid.iterate!))).to eql false
  end

  it 'should return last number of generations' do
    generation_log.add(Generation.new(grid))
    generation_log.add(Generation.new(grid.iterate!))
    expect(generation_log.last_number).to eql 2
  end
end