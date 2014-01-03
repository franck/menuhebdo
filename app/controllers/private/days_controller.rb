#encoding:utf-8
module Private
  class DaysController < PrivateController

    def new
      menu_template = MenuTemplate.find(params[:menu_template_id])
      day = menu_template.days.create
      redirect_to private_menu_template_path(menu_template)
    end

    def destroy
      menu_template = MenuTemplate.find(params[:menu_template_id])
      day = menu_template.days.find(params[:id])
      day.destroy
      redirect_to private_menu_template_path(menu_template), notice: "#{DayPresenter.new(day).name} supprimé"
    end
  end
end

