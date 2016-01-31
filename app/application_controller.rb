require_relative 'file_to_grid.rb'
require_relative 'view.rb'

class ApplicationController
  def initialize
    render :welcome
    file_name = gets[0...-1]

    grid = FileToGrid.convert file_name
    generation = 0

    while true
      render :show_grid, grid: grid, generation_number: generation
      grid.iterate!
      generation = generation + 1
      gets.downcase == "exit\n" ? break : nil
    end

    render :exit
  end

private

  def render name, data = {}
    view = View.new name, data
    view.render
  end
end
