require_relative 'file_to_grid.rb'
require_relative 'view.rb'
require_relative 'generation_died.rb'
require_relative 'game_engine.rb'

class ApplicationController
  def initialize
  end

  def run
    render :welcome
    file_name = gets[0...-1]

    game_engine = GameEngine.new(file_name)
    render :show_grid, game_engine.data_to_render

    while true
      render :show_grid, game_engine.next!
      sleep 1
    end

  rescue GenerationDied
    render :exit
  end

private

  def render name, data = {}
    view = View.new(name, data)
    view.render
  end
end
