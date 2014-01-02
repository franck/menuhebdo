#encoding:utf-8
describe "SubscriberPresenter" do

  describe "#validated_at" do

    it "display Non if nil" do
      subscriber = double
      subscriber.stub(:validated_at).and_return(nil)
      SubscriberPresenter.new(subscriber).validated_at.should == "Non"
    end

    it "display the date if not nil" do
      Timecop.freeze
      subscriber = double
      subscriber.stub(:validated_at).and_return(Time.now)
      SubscriberPresenter.new(subscriber).validated_at.should == Time.now.strftime("%d/%m/%Y à %H:%M")
    end
  end

end
