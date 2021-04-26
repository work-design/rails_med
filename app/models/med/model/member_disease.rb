module Med
  module Model::MemberDisease
    extend ActiveSupport::Concern

    included do
      attribute :position, :integer

      belongs_to :member
      belongs_to :disease

      acts_as_list
    end

  end
end
