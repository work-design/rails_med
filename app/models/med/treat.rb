module Med
  class Treat < ApplicationRecord
    include Model::Treat
    include Detail::Ext::Knowable
  end
end
