module Med
  class Panel::DiagnosesController < Panel::BaseController
    before_action :set_diagnose, only: [:show, :edit, :update, :destroy]

    def index
      @diagnoses = Diagnose.page(params[:page])
    end

    def new
      @diagnose = Diagnose.new
    end

    def create
      @diagnose = Diagnose.new(diagnose_params)

      unless @diagnose.save
        render :new, locals: { model: @diagnose }, status: :unprocessable_entity
      end
    end

    def show
    end

    def edit
    end

    def update
      @diagnose.assign_attributes(diagnose_params)

      unless @diagnose.save
        render :edit, locals: { model: @diagnose }, status: :unprocessable_entity
      end
    end

    def destroy
      @diagnose.destroy
    end

    private
    def set_diagnose
      @diagnose = Diagnose.find(params[:id])
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
