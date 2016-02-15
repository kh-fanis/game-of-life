require_relative 'models/generation_log.rb'
require_relative 'models/generation.rb'

require_relative 'file_to_grid.rb'
require_relative 'generation_died.rb'

class GameEngine
  attr_accessor :grid, :generation_log

  def initialize file_name
    @grid           = FileToGrid.convert(file_name)
    @generation_log = GenerationLog.new
  end

  def next!
    if !@generation_log.add(Generation.new(grid.iterate!)) or grid.all_dead?
      raise GenerationDied
    end

    data_to_render
  end

  def data_to_render
    { grid: @grid, generation_number: @generation_log }
  end
end