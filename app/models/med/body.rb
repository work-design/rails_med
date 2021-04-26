module Med
  class Body < ApplicationRecord
    include Model::Body
    include Com::Ext::Taxon
  end
end
