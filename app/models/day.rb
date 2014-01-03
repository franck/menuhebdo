class Day < ActiveRecord::Base
  belongs_to :menu_template
  has_many :meals, dependent: :destroy

  before_create :set_position
  after_destroy :reorder_position

  protected

  def set_position
    actual_number_of_days = self.menu_template.days.size
    self.position = actual_number_of_days + 1
  end

  def reorder_position
    days = self.menu_template.days.order("position asc")
    days.delete(self)
    days.each_with_index{|day, index| day.update_attribute(:position, index+1) }
  end
end
