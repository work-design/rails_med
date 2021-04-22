class Body < ApplicationRecord
  include Com::Ext::Taxon

  attribute :name, :string

  has_one_attached :image
  has_many_attached :images

end
