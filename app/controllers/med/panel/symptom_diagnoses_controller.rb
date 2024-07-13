module Med
  class Panel::SymptomDiagnosesController < Panel::BaseController
    before_action :set_symptom
    before_action :set_symptom_diagnose, only: [:show, :edit, :update, :destroy, :actions]
    before_action :set_new_symptom_diagnose, only: [:new, :create]

    def index
      @symptom_diagnoses = @symptom.symptom_diagnoses.page(params[:page])
    end

    def new
      @symptom_diagnose = @symptom.symptom_diagnoses.build(diagnose_id: @symptom.diagnose_id)
    end

    private
    def set_symptom
      @symptom = Symptom.find params[:symptom_id]
    end

    def set_symptom_diagnose
      @symptom_diagnose = @symptom.symptom_diagnoses.find(params[:id])
    end

    def set_new_symptom_diagnose
      @symptom_diagnose = @symptom.symptom_diagnoses.build(symptom_diagnose_params)
    end

    def symptom_diagnose_params
      params.fetch(:symptom_diagnose, {}).permit(
        :value,
        :diagnose_id
      )
    end

  end
end
