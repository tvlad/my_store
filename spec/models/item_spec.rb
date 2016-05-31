require 'spec_helper'
require 'rails_helper'

describe Item do
  
  it 'should do something' do
    expect(1+1).to  eq(2)
  end
  
  it "make shure that name isn't empty" do
    item = Item.new(name:  '')
    item.valid?
    expect(item.errors[:name]).not_to be_empty
  end
  
  
end