class Meal < ActiveRecord::Base
  belongs_to :day
  belongs_to :recipe

  before_create :set_position
  after_destroy :reorder_position

  protected

  def set_position
    actual_number_of_meals = self.day.meals.size
    self.position = actual_number_of_meals + 1
  end


  def reorder_position
    meals = self.day.meals.order("position asc")
    meals.delete(self)
    meals.each_with_index{|meal, index| meal.update_attribute(:position, index+1) }
  end
end
