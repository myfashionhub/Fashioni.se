require 'spec_helper'

describe Item do
  it 'has a description' do
    item = Item.new(description: 'YSL evening gown')
    expect(item.description).to eq 'YSL evening gown'
  end  
end
