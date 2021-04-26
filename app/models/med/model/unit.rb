# 系统用到的单位

module Med
  module Model::Unit
    extend ActiveSupport::Concern

    included do
      attribute :name, :string
      attribute :split, :string

      enum split: {
        milli: 'milli',
        cent: 'cent'
      }
    end

  end
end
