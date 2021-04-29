module Med
  class Symptom < ApplicationRecord
    include Model::Symptom
    include Com::Ext::Sequence
    include Detail::Ext::Knowable
  end
end
