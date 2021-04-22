class Med::Admin::MembersController < Med::Admin::BaseController
  before_action :set_member

  def diseases
    @select_ids = @member.member_diseases.pluck(:disease_id)
    @diseases = @member.diseases.page(params[:page])
  end

  def search_diseases
    q_params = {}
    q_params.merge! params.permit('name-like')

    @select_ids = @member.member_diseases.pluck(:disease_id)
    @diseases = Disease.default_where(q_params).limit(5)
  end

  def edit_disease
  end

  def update_disease
    @member_disease = @member.member_diseases.find_or_initialize_by(disease_id: params[:disease_id])

    if @member_disease.persisted?
      @member_disease.destroy
    else
      @member_disease.save
    end
  end

  def destroy
    @profile_symptom.destroy
  end

  private
  def set_member
    @member = Member.find params[:id]
  end

  def member_params
    params.fetch(:member, {}).permit(
      :disease_id
    )
  end

end
