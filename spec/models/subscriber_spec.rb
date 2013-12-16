require 'spec_helper'

describe Subscriber do

  describe "generate token on create" do
    subject { Subscriber.create(email: 'franck@example.com') }
    it { expect(subject.token).not_to be_nil }
  end

end
