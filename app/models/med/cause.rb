module Med
  class Cause < ApplicationRecord
    include Model::Cause
    include Detail::Ext::Knowable
  end
end
