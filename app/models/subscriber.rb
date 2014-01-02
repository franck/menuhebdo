class Subscriber < ActiveRecord::Base
 include Tokenable 

  validates :email, :format => { :with => EMAIL_REGEXP, :allow_blank => false }, uniqueness: true

  def validate!
    self.validated_at = Time.now
    self.save
  end
end
