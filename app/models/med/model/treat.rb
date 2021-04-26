module Med
  module Model::Treat
    extend ActiveSupport::Concern

    included do
      attribute :name, :string
      attribute :type, :string

      has_many :symptom_treats, dependent: :destroy
      has_many :treats, through: :symptom_treats
    end

  end
end

# :logo, :string
# :overview, :string
# :unit_id, :integer
