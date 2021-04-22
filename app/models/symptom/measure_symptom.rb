# 可测量的症状，如身高、体重，数据呈线性
# 需配置单位，如 cm/斤
class MeasureSymptom < Symptom
  attribute :unit, :string, comment: '单位'

  has_many :measure_values

  accepts_nested_attributes_for :measure_values, allow_destroy: true

end
