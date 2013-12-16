class Batman < ActionMailer::Base

  def validation_email(email, token)
    @token = token
    mail(
      to: email,
      subject: "Validez votre email"
    )
  end

end
