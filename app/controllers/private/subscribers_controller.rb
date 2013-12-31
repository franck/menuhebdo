module Private
  class SubscribersController < PrivateController

    def index
      @subscribers = Subscriber.all
    end

  end
end
