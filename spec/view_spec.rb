require_relative 'spec_helper.rb'

describe View do
  let(:view) { View.new :view_test_file }
  let(:view_with_data) { View.new :for_test_with_data }

  it 'should open view file' do
    expect(view.template).to eql "hello world. Now <%= Time.now.hour %>:<%= Time.now.min %>\n"
  end

  it 'should correctly parse code inside <%= code %>' do
    expect(view.parse).to eql "hello world. Now #{ Time.now.hour }:#{Time.now.min}\n"
  end

  it 'should render text out to screen' do
    view
    expect { view.render }.to output("hello world. Now #{ Time.now.hour }:#{ Time.now.min }\n").to_stdout
  end

  it 'should render text with data' do
    view_with_data
    expect { view_with_data.render some_variable: 'this is from variable', another_one_variable: 'this from variable too' }.to output('This should correctly output the data\nthis is from variable\nthis from variable too\n')
  end
end
