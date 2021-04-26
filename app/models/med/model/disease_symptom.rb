module Med
  module Model::DiseaseSymptom
    extend ActiveSupport::Concern

    included do
      attribute :required, :boolean, comment: '本症状是否必需'

      belongs_to :disease
      belongs_to :symptom
    end


  end
end
