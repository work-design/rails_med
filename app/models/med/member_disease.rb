class MemberDisease < ApplicationRecord
  attribute :position, :integer

  belongs_to :member
  belongs_to :disease

  acts_as_list
end
