module Med
  class ProfileSymptom < ApplicationRecord
    include Model::ProfileSymptom
    include Com::Ext::Sequence
  end
end
