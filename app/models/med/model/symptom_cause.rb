module Med
  module Model::SymptomCause
    extend ActiveSupport::Concern

    included do
      belongs_to :symptom
      belongs_to :cause
    end

  end
end
