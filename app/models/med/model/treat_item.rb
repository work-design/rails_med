class TreatItem < ApplicationRecord
  attribute :position, :integer
  attribute :unit_name, :string

  belongs_to :treat
  belongs_to :unit

end


# :item_id, :integer
# :position, :integer
