# 用户体征、症状等记录
# 体征：体重、身高、血压
module Med
  module Model::ProfileSymptom
    extend ActiveSupport::Concern

    included do
      attribute :symptom_name, :string
      attribute :symptom_type, :string
      attribute :value, :string
      attribute :recorded_at, :datetime
      attribute :expire_at, :datetime
      attribute :position, :integer

      belongs_to :profile
      belongs_to :symptom
      belongs_to :symptom_body, optional: true
      belongs_to :body, optional: true
      belongs_to :symptom_diagnose, optional: true

      before_save :sync_symptom_infos, if: -> { symptom_id_changed? && symptom }
      acts_as_list
    end

    def sync_symptom_infos
      self.symptom_name = symptom.name
      self.symptom_type = symptom.type
      self.sequence = symptom.sequence
    end

    class_methods do
      def sequences
        self.select(:sequence).distinct.pluck(:sequence).compact.sort
      end
    end

  end
end
