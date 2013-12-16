#encoding: utf-8
require 'validation_email'

describe ValidationEmail do

  describe "#send" do
    let(:token) { "dy4hf567dB343jhdge3987" }
    let(:email) { "franck@example.com" }
    subject { ValidationEmail.new(email, token) }

    it 'sends an email' do
      expect { subject.send }.to change(ActionMailer::Base.deliveries, :size).by(1)
      last_email = ActionMailer::Base.deliveries.last
      last_email.to.should include(email)
      last_email.body.should include(token)
    end

  end

end
