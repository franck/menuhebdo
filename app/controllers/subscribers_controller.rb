require 'validation_email'

class SubscribersController < ApplicationController

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(params_subscriber)
    if @subscriber.save
      ValidationEmail.new(@subscriber.email, @subscriber.token).send
      redirect_to validate_subscriber_path(@subscriber)
    else
      render :new
    end
  end

  def validate
    @subscriber = Subscriber.find(params[:id])
  end

  def validation
    @subscriber = Subscriber.find_by_token(params[:token])
    if @subscriber
      @subscriber.validate!
      redirect_to thanks_subscribers_path
    end
  end

  def thanks
  end

  protected

  def params_subscriber
    params.require(:subscriber).permit(:email)
  end

end
