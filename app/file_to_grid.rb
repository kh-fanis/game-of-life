require_relative 'models/grid.rb'

module FileToGrid
  @@ALIVE_CELL_LOOKING_LIKE = '*'

  def self.convert file_name
    string_matrix = nil

    File.open "#{File.dirname(__FILE__)}/../#{file_name}" do |file|
      string_matrix = file.read
    end

    string_to_grid string_matrix
  end

  def self.string_to_grid matrix, symbol = @@ALIVE_CELL_LOOKING_LIKE
    width, height = position_of matrix
    grid          = Grid.new height, width

    columns = matrix.split("\n").map do |str|
      str.split("")
    end

    columns.each_with_index do |arr, x|
      arr.each_with_index do |str, y|
        grid.cell_at(x, y).revive! if str == symbol
      end
    end

    grid
  end

  def self.position_of matrix
    [matrix.split("\n")[0].length, matrix.split("\n").length]
  end
end
