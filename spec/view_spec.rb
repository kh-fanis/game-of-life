require_relative 'spec_helper.rb'

describe View do
  let(:view) { View.new :view_test_file }
  let(:view_with_data) { View.new :for_test_with_data, some_variable: 'this is from variable', another_one_variable: 'this from variable too' }

  it 'should open view file' do
    expect(view.template).to eql "hello world. Now <%= Time.now.hour %>:<%= Time.now.min %>\n"
  end

  it 'should correctly parse code inside <%= code %>' do
    expect(view.parsed_template).to eql "hello world. Now #{ Time.now.hour }:#{Time.now.min}\n"
  end

  it 'should render text out to screen' do
    expect { view.render }.to output("hello world. Now #{ Time.now.hour }:#{ Time.now.min }\n").to_stdout
  end

  it 'should render text with data' do
    expect { view_with_data.render }.to output("This should correctly output the data\n\nthis from variable too\n").to_stdout
  end
end
