class Diagnose < ApplicationRecord
  include Detail::Ext::Knowable
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
