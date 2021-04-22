class Sample < ApplicationRecord
  attribute :title, :string

  belongs_to :profile
  has_many :sample_symptoms, dependent: :destroy
  has_many :symptoms, through: :sample_symptoms

end
