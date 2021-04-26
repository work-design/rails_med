module Med
  module Model::SymptomTreat
    extend ActiveSupport::Concern

    included do
      belongs_to :symptom
      belongs_to :treat
    end

  end
end
