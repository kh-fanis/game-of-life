require_relative 'spec_helper.rb'

describe GameEngine do
  let(:game_engine) { GameEngine.new }

  it 'should generate grid and have generations stack' do
    game_engine.next!
  end
end