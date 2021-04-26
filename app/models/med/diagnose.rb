module Med
  class Diagnose < ApplicationRecord
    include Model::Diagnose
    include Detail::Ext::Knowable
  end
end
