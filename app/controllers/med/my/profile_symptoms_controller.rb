module Med
  class My::ProfileSymptomsController < My::BaseController
    before_action :set_profile
    before_action :set_profile_symptom, only: [:show, :edit, :update, :destroy]
    before_action :set_symptoms, only: [:index, :new, :create]

    def index
      @profile_symptoms = @profile.profile_symptoms.page(params[:page])
    end

    def new
      @symptom = @symptoms[0]
      if @symptom&.physical
        @profile_symptom = @profile.profile_symptoms.build(symptom_id: @symptom.id)
      else
        @profile_symptom = @profile.profile_symptoms.build
      end
    end

    def create
      @profile.assign_attributes(profile_params)

      unless @profile.save
        render :new, locals: { model: @profile }, status: :unprocessable_entity
      end
    end

    def value
      @profile_symptom = @profile.profile_symptoms.build
      @profile_symptom.assign_attributes(profile_symptom_params)

      if @profile_symptom.save
        render 'create', locals: { return_to: mine_profile_symptoms_url(@profile) }
      else
        render :new, locals: { model: @profile_symptom }, status: :unprocessable_entity
      end
    end

    def show
    end

    def edit
    end

    def update
      @profile_symptom.assign_attributes(profile_symptom_params)

      unless @profile_symptom.save
        render :edit, locals: { model: @profile_symptom }, status: :unprocessable_entity
      end
    end

    def destroy
      @profile_symptom.destroy
    end

    private
    def set_profile
      @profile = Profiled::Profile.find params[:profile_id]
    end

    def set_symptoms
      max_sequence = @profile.profile_symptoms.max_sequence
      @symptoms = Symptom.default_where(sequence: max_sequence)
    end

    def set_profile_symptom
      @profile_symptom = ProfileSymptom.find(params[:id])
    end

    def profile_params
      params.fetch(:profile, {}).permit(
        symptom_ids: []
      )
    end

    def profile_symptom_params
      params.fetch(:profile_symptom, {}).permit(
        :symptom_id,
        :value,
        body_ids: []
      )
    end

  end
end
