class MenuTemplate < ActiveRecord::Base
  has_many :days, dependent: :destroy

  validates :title, presence: true

end
