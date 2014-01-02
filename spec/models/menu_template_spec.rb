require 'spec_helper'

describe MenuTemplate do

  it "creates a menu template if everything is OK" do
    MenuTemplate.new(title: 'foo').should be_valid
  end

  it "raises an error if title is missing" do
    MenuTemplate.new(title: '').should_not be_valid
  end


end
