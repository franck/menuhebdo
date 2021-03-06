class Recipe < ActiveRecord::Base
  has_many :meals

  validates :name, presence: true, uniqueness: true
end
