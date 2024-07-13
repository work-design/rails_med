module Med
  class Panel::DiagnosesController < Panel::BaseController
    before_action :set_diagnose, only: [:show, :edit, :update, :destroy, :actions]
    before_action :set_new_diagnose, only: [:new, :create]

    def index
      @diagnoses = Diagnose.page(params[:page])
    end

    private
    def set_diagnose
      @diagnose = Diagnose.find(params[:id])
    end

    def set_new_diagnose
      @diagnose = Diagnose.new(diagnose_params)
    end

    def diagnose_params
      params.fetch(:diagnose, {}).permit(
        :name,
        :actor,
        :unit_id
      )
    end

  end
end
