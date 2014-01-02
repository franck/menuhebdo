require 'spec_helper'

describe Day do
  describe "#set_position" do
    it "set position to 1 if no days yet" do
      menu_template = MenuTemplate.create(title: 'foo')
      day = menu_template.days.create
      day.position.should == 1
    end
    it "set increment the position if days are present" do
      menu_template = MenuTemplate.create(title: 'foo')
      menu_template.days.create
      day = menu_template.days.create
      day.position.should == 2
    end
    it "reorder days on destroy" do
      menu_template = MenuTemplate.create(title: 'foo')
      day1 = menu_template.days.create
      day2 = menu_template.days.create
      day3 = menu_template.days.create
      day1.destroy
      day2.reload
      day3.reload
      day2.position.should == 1
      day3.position.should == 2
    end
  end
end
