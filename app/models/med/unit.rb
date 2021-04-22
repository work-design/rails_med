# 系统用到的单位
class Unit < ApplicationRecord
  attribute :name, :string
  attribute :split, :string

  enum split: {
    milli: 'milli',
    cent: 'cent'
  }

end
