class SymptomBody < ApplicationRecord
  attribute :position, :integer

  belongs_to :symptom
  belongs_to :body

  acts_as_list
end
