module Med
  module Model::TreatItem
    extend ActiveSupport::Concern

    included do
      attribute :position, :integer
      attribute :unit_name, :string

      belongs_to :treat
      belongs_to :unit
    end

  end
end

# :item_id, :integer
# :position, :integer
