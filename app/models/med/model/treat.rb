class Treat < ApplicationRecord
  include Detail::Ext::Knowable
  attribute :name, :string
  attribute :type, :string

  has_many :symptom_treats, dependent: :destroy
  has_many :treats, through: :symptom_treats

end

# :logo, :string
# :overview, :string
# :unit_id, :integer
