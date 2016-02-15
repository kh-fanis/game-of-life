require 'erb'
require 'ostruct'

class View
  attr_reader :template, :action, :data

  def initialize action_file, data = {}
    @action, @data = action_file, data

    @template = File.open("#{File.dirname(__FILE__)}/../views/#{@action}.view", 'r').read

    @erb = ERB.new(template)
  end

  def parsed_template
    @erb.result(OpenStruct.new(@data).instance_eval { binding })
  end

  def render
    clear_screen
    puts parsed_template
  end

  def clear_screen
    system 'clear'
  end
end
