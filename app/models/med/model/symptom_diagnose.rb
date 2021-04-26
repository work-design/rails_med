module Med
  module Model::SymptomDiagnose
    extend ActiveSupport::Concern

    included do
      attribute :value, :string
      attribute :position, :integer

      belongs_to :diagnose
      belongs_to :symptom

      acts_as_list
    end

  end
end
