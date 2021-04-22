class Cause < ApplicationRecord
  include Detail::Ext::Knowable
  attribute :name, :string
  attribute :type, :string

  has_many :symptom_causes, dependent: :destroy
  has_many :symptoms, through: :symptom_causes

end
