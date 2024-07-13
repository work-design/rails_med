module Med
  class Panel::TreatsController < Panel::BaseController
    before_action :set_treat, only: [:show, :edit, :update, :destroy, :actions]
    before_action :set_new_treat, only: [:new, :create]

    def index
      @treats = Treat.page(params[:page])
    end

    private
    def set_treat
      @treat = Treat.find(params[:id])
    end

    def set_new_treat
      @treat = Treat.new(treat_params)
    end

    def treat_params
      params.fetch(:treat, {}).permit(
        :name,
        :type
      )
    end

  end
end
