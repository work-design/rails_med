module Med
  module Model::SolutionTreat
    extend ActiveSupport::Concern

    included do
      belongs_to :solution
      belongs_to :treat
    end

  end
end
