# 用户体征、症状等记录
# 体征：体重、身高、血压
class ProfileSymptom < ApplicationRecord
  include Com::Ext::Sequence
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

  def sync_symptom_infos
    self.symptom_name = symptom.name
    self.symptom_type = symptom.type
    self.sequence = symptom.sequence
  end

  def xx

  end

  def self.sequences
    self.select(:sequence).distinct.pluck(:sequence).compact.sort
  end

end
