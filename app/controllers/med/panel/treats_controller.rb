module Med
  class Panel::TreatsController < Panel::BaseController
    before_action :set_treat, only: [:show, :edit, :update, :destroy]

    def index
      @treats = Treat.page(params[:page])
    end

    def new
      @treat = Treat.new
    end

    def create
      @treat = Treat.new(treat_params)

      unless @treat.save
        render :new, locals: { model: @treat }, status: :unprocessable_entity
      end
    end

    def show
    end

    def edit
    end

    def update
      @treat.assign_attributes(treat_params)

      unless @treat.save
        render :edit, locals: { model: @treat }, status: :unprocessable_entity
      end
    end

    def destroy
      @treat.destroy
    end

    private
    def set_treat
      @treat = Treat.find(params[:id])
    end

    def treat_params
      params.fetch(:treat, {}).permit(
        :name,
        :type
      )
    end

  end
end
