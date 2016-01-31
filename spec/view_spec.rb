require_relative 'spec_helper.rb'

describe View do
  let(:view) { View.new :view_test_file }

  it 'should open view file' do
    expect(view.template).to eql "hello world. Now <%= Time.now.hour %>:<%= Time.now.min %>\n"
  end

  it 'should correctly parse code inside <%= code %>' do
    expect(view.parse).to eql "hello world. Now #{ Time.now.hour }:#{Time.now.min}\n"
  end

  it 'should render text out to screen' do
    expect { view.render }.to output('hello world. Now #{ Time.now.hour }:#{ Time.now.min }\n').to_stdout
  end
end
