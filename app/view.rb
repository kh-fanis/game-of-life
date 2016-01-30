class View
  attr_reader :template, :action

  def initialize action_file
    @action = action_file
    File.open("#{File.dirname(__FILE__)}/views/#{@action}.view", 'r') { |file| puts @template = file.read }
  end
end
