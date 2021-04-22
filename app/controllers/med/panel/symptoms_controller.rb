module Med
  class Panel::SymptomsController < Panel::BaseController
    before_action :set_symptom, only: [:show, :edit, :bodies, :causes, :update, :destroy]

    def index
      @symptoms = Symptom.includes(:diagnose, :bodies).order(id: :asc).page(params[:page])
    end

    def new
      @symptom = Symptom.new
    end

    def create
      @symptom = Symptom.new(symptom_params)

      unless @symptom.save
        render :new, locals: { model: @symptom }, status: :unprocessable_entity
      end
    end

    def show
    end

    def edit
    end

    def bodies
      @bodies = Body.all
    end

    def causes
      @causes = Cause.all
    end

    def update
      @symptom.assign_attributes(symptom_params)

      unless @symptom.save
        render :edit, locals: { model: @symptom }, status: :unprocessable_entity
      end
    end

    def destroy
      @symptom.destroy
    end

    private
    def set_symptom
      @symptom = Symptom.find(params[:id])
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
