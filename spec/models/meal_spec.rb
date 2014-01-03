require 'spec_helper'

describe Meal do
  describe "#set_position" do
    let(:menu_template) { MenuTemplate.create(title: 'foo') }
    let(:day) { menu_template.days.create }
    it "set position to 1 if first meal in day" do
      meal = day.meals.create
      meal.position.should == 1
    end
    it "increments the position if not the first meal in day" do
      day.meals.create
      meal = day.meals.create
      meal.position.should == 2
    end
    it "reorder meals on destroy" do
      meal1 = day.meals.create
      meal2 = day.meals.create
      meal3 = day.meals.create
      meal1.destroy
      meal2.reload
      meal3.reload
      meal2.position.should == 1
      meal3.position.should == 2
    end
  end
end
