class View
  attr_reader :template, :action

  def initialize action_file
    @action = action_file
    File.open("#{File.dirname(__FILE__)}/views/#{@action}.view", 'r') { |file| puts @template = file.read }
  end

  def parse
    template.gsub(/<%=\s*[^<]+\s*%>/){ |code| eval /<%=\s*(.*)\s*%>/.match(code)[1]}
  end
end
