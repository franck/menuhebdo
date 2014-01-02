#encoding:utf-8
class SubscriberPresenter

  def initialize(subscriber)
    @subscriber = subscriber
  end

  def validated_at
    if @subscriber.validated_at
      I18n.l(@subscriber.validated_at, format: "%d/%m/%Y à %H:%M")
    else
      "Non"
    end
  end

end
