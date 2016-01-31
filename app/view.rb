class View
  attr_reader :template, :action

  def initialize action_file
    @action = action_file
    File.open("#{File.dirname(__FILE__)}/views/#{@action}.view", 'r') { |file| puts @template = file.read }
    parse
  end

  def parse
    @parsed_text = template.gsub(/<%=\s*[^<]+\s*%>/){ |code| eval /<%=\s*(.*)\s*%>/.match(code)[1]}
  end

  def render
    clear_screen
    print @parsed_text.gsub(/<h5>[^<]+<\/h5>/){ |code| eval /<h5>(.*)<\/h5>/.match(code)[1]}
  end

  def clear_screen
    system 'clear'
  end
end
