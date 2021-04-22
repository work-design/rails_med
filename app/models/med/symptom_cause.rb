class SymptomCause < ApplicationRecord

  belongs_to :symptom
  belongs_to :cause

end
