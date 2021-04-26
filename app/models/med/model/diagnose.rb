module Med
  module Model::Diagnose
    extend ActiveSupport::Concern

    included do
      attribute :type, :string
      attribute :name, :string
      attribute :actor, :string

      has_many :symptoms, dependent: :nullify

      enum actor: {
        oneself: 'oneself',
        doctor: 'doctor',
        subjective: 'subjective',
        objective: 'objective'
      }
    end

  end
end
