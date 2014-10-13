require 'rspec'
require_relative '../main.rb'

describe 'game starts' do
  it 'knows the berry count' do
    expect(red_berry).to eql(1)
  end
end
