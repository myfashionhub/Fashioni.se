require 'spec_helper'

describe Fashionista do

  it 'has a username' do
    fashionista = Fashionista.new(username: 'myfashionhub')
    expect(fashionista.username).to eq 'myfashionhub' 
  end
end
