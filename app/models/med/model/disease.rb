module Med
  module Model::Disease
    extend ActiveSupport::Concern

    included do
      attribute :name, :string

      has_many :disease_symptoms, dependent: :destroy
      has_many :symptoms, through: :disease_symptoms
    end

  end
end
