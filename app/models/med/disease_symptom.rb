class DiseaseSymptom < ApplicationRecord
  attribute :required, :boolean, comment: '本症状是否必需'

  belongs_to :disease
  belongs_to :symptom



end
