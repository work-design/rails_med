module Med
  module Ext::Profile
    extend ActiveSupport::Concern

    included do
      has_many :profile_symptoms, class_name: 'Med::ProfileSymptom', dependent: :destroy
      has_many :symptoms, class_name: 'Med::Symptom', through: :profile_symptoms
    end

  end
end
