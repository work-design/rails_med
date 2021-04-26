module Med
  class Disease < ApplicationRecord
    include Model::Disease
    include Detail::Ext::Knowable
  end
end
