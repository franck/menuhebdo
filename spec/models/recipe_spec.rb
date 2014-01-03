require 'spec_helper'

describe Recipe do

  it "create a recipe when everything is OK" do
    Recipe.new(name: 'foo').should be_valid
  end
  it "raises an error when name is blank" do
    Recipe.new(name: '').should_not be_valid
  end
  it "raises an error when name is already taken" do
    recipe = create(:recipe)
    Recipe.new(name: recipe.name).should_not be_valid
  end

end
