module Med
  class DiseasesController < BaseController
    before_action :set_disease, only: [:show, :edit, :update, :destroy]

    def index
      @diseases = Disease.page(params[:page])
    end

    def new
      @disease = Disease.new
    end

    def create
      @disease = Disease.new(disease_params)

      unless @disease.save
        render :new, locals: { model: @disease }, status: :unprocessable_entity
      end
    end

    def show
    end

    def edit
    end

    def update
      @disease.assign_attributes(disease_params)

      unless @disease.save
        render :edit, locals: { model: @disease }, status: :unprocessable_entity
      end
    end

    def destroy
      @disease.destroy
    end

    private
    def set_disease
      @disease = Disease.find(params[:id])
    end

    def disease_params
      params.fetch(:disease, {}).permit(
      )
    end

  end
end
