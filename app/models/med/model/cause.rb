module Med
  module Model::Cause
    extend ActiveSupport::Concern

    included do
      attribute :name, :string
      attribute :type, :string

      has_many :symptom_causes, dependent: :destroy
      has_many :symptoms, through: :symptom_causes
    end

  end
end
