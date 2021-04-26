module Med
  module Model::Sample
    extend ActiveSupport::Concern

    included do
      attribute :title, :string

      belongs_to :profile
      has_many :sample_symptoms, dependent: :destroy
      has_many :symptoms, through: :sample_symptoms
    end

  end
end
