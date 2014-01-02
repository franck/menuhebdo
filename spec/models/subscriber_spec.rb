require 'spec_helper'

describe Subscriber do

  describe "generate token on create" do
    subject { Subscriber.create(email: 'franck@example.com') }
    it { expect(subject.token).not_to be_nil }
  end

  describe "#save" do
    it "create a record if everything is OK" do
      Subscriber.new(email: 'franck@example.com').should be_valid
    end
    it "raises an error if email is missing"  do
      Subscriber.new(email: '').should_not be_valid
    end
    it "raises an error if email is invalid" do
      Subscriber.new(email: 'franck').should_not be_valid
    end
    it "raises an error if email is already taken" do
      subscriber = create(:subscriber)
      Subscriber.new(email: subscriber.email).should_not be_valid
    end
  end

  describe "#validate!" do
    it "set validated_at with the current time" do
      subscriber = create(:subscriber)
      Timecop.freeze
      subscriber.validate!
      expect(subscriber.validated_at).to eq(Time.now)
    end
  end

end
