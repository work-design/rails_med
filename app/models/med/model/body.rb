module Med
  module Model::Body
    extend ActiveSupport::Concern

    included do
      attribute :name, :string

      has_one_attached :image
      has_many_attached :images
    end

  end
end
