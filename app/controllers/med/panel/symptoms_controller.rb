module Med
  class Panel::SymptomsController < Panel::BaseController
    before_action :set_symptom, only: [:show, :edit, :bodies, :causes, :update, :destroy, :actions]
    before_action :set_new_symptom, only: [:new, :create]

    def index
      @symptoms = Symptom.includes(:diagnose, :bodies).order(id: :asc).page(params[:page])
    end

    def bodies
      @bodies = Body.all
    end

    def causes
      @causes = Cause.all
    end

    private
    def set_symptom
      @symptom = Symptom.find(params[:id])
    end

    def set_new_symptom
      @symptom = Symptom.new(symptom_params)
    end

    def symptom_params
      params.fetch(:symptom, {}).permit(
        :name,
        :type,
        :mutable,
        :primary,
        :physical,
        :bodily,
        :content,
        :sequence,
        :diagnose_id,
        body_ids: [],
        cause_ids: []
      )
    end

  end
end
