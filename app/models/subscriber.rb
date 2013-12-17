class Subscriber < ActiveRecord::Base
 include Tokenable 

  validates :email, :format => { :with => EMAIL_REGEXP, :allow_blank => false }, uniqueness: true
end
