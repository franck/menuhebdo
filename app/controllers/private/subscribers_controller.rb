#encoding:utf-8
module Private
  class SubscribersController < PrivateController

    def index
      @subscribers = Subscriber.paginate(page: params[:page])
    end

    def edit
      @subscriber = Subscriber.find(params[:id])
    end

    def update
      @subscriber = Subscriber.find(params[:id])
      if @subscriber.update_attributes(params_subscriber)
      redirect_to private_subscribers_path, notice: "Abonné modifié"
      else
        render :edit
      end
    end

    def destroy
      @subscriber = Subscriber.find(params[:id])
      @subscriber.destroy
      redirect_to private_subscribers_path, notice: "Abonné supprimé"
    end

    def validate
      @subscriber = Subscriber.find(params[:id])
      @subscriber.validate!
      redirect_to private_subscribers_path, notice: "Abonné validé"
    end

    protected

    def params_subscriber
      params.require(:subscriber).permit([:email])
    end
  end
end
