require_relative 'view.rb'

class ApplicationView < View
  @@DEFAULT_REPLACEMENT_FOR_ALIVE_CELL = '*'
  @@DEFAULT_REPLACEMENT_FOR_DEAD_CELL  = ' '

  def render
    puts @data
    @data = @data.map { |k, object| [k, self.class.object_to_s(object)] }.to_h
    puts @data

    super
  end

  def self.object_to_s object
    case object

    when Grid
      object.cells.map do |col|
        col.map do |cell|
          cell.alive? ? @@DEFAULT_REPLACEMENT_FOR_ALIVE_CELL : @@DEFAULT_REPLACEMENT_FOR_DEAD_CELL
        end.join('')
      end.join("\n")

    when GenerationLog
      object.last_number.to_s

    else
      object.to_s
    end
  end
end