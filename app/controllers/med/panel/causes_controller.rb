module Med
  class Panel::CausesController < Panel::BaseController
    before_action :set_cause, only: [:show, :edit, :update, :destroy]

    def index
      @causes = Cause.page(params[:page])
    end

    def new
      @cause = Cause.new
    end

    def create
      @cause = Cause.new(cause_params)

      unless @cause.save
        render :new, locals: { model: @cause }, status: :unprocessable_entity
      end
    end

    def show
    end

    def edit
    end

    def update
      @cause.assign_attributes(cause_params)

      unless @cause.save
        render :edit, locals: { model: @cause }, status: :unprocessable_entity
      end
    end

    def destroy
      @cause.destroy
    end

    private
    def set_cause
      @cause = Cause.find(params[:id])
    end

    def cause_params
      params.fetch(:cause, {}).permit(
        :name,
        :type
      )
    end

  end
end
