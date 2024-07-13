module Med
  class Panel::DiseasesController < Panel::BaseController
    before_action :set_disease, only: [:show, :edit, :update, :destroy, :actions]
    before_action :set_new_disease, only: [:new, :create]

    def index
      @diseases = Disease.page(params[:page])
    end

    private
    def set_disease
      @disease = Disease.find(params[:id])
    end

    def set_new_disease
      @disease = Disease.new(disease_params)
    end

    def disease_params
      params.fetch(:disease, {}).permit(
        :name,
        symptom_ids: []
      )
    end

  end
end
