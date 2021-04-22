class Disease < ApplicationRecord
  include Detail::Ext::Knowable
  attribute :name, :string

  has_many :disease_symptoms, dependent: :destroy
  has_many :symptoms, through: :disease_symptoms

end
