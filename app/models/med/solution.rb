class Solution < ActiveRecord::Base
  attribute :name, :string


  has_many :samples, dependent: :destroy
  has_many :solution_treats, dependent: :destroy
  has_many :treats, through: :solution_treats


end
