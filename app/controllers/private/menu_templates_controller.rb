#encoding:utf-8
module Private
  class MenuTemplatesController < PrivateController
    def index
      @menu_template = MenuTemplate.paginate(page: params[:page])
    end

    def show
      @menu_template = MenuTemplate.find(params[:id])
    end

    def new
      @menu_template = MenuTemplate.new
    end

    def create
      @menu_template = MenuTemplate.new(params_menu_template)
      if @menu_template.save
        redirect_to edit_private_menu_template_path(@menu_template)
      else
        render :new
      end
    end

    def edit
      @menu_template = MenuTemplate.find(params[:id])
    end

    def update
      @menu_template = MenuTemplate.find(params[:id])
      if @menu_template.update_attributes(params_menu_template)
        redirect_to private_menu_template_path(@menu_template)
      else
        render :edit
      end
    end

    def destroy
      @menu_template = MenuTemplate.find(params[:id])
      @menu_template.destroy
      redirect_to private_menu_templates_path, notice: "Modèle supprimé"
    end

    protected

    def params_menu_template
      params.require(:menu_template).permit([:title])
    end

  end
end
