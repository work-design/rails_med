module Med
  class Panel::CausesController < Panel::BaseController
    before_action :set_cause, only: [:show, :edit, :update, :destroy, :actions]
    before_action :set_new_cause, only: [:new, :create]

    def index
      @causes = Cause.page(params[:page])
    end

    private
    def set_cause
      @cause = Cause.find(params[:id])
    end

    def set_new_cause
      @cause = Cause.new(cause_params)
    end

    def cause_params
      params.fetch(:cause, {}).permit(
        :name,
        :type
      )
    end

  end
end
