class ValidationEmail

  attr_reader :email, :token

  def initialize(email, token)
    @email = email
    @token = token
  end

  def send
    Batman.validation_email(email, token).deliver
  end


end
