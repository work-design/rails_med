module Med
  module Model::SymptomBody
    extend ActiveSupport::Concern

    included do
      attribute :position, :integer

      belongs_to :symptom
      belongs_to :body

      acts_as_list
    end

  end
end
