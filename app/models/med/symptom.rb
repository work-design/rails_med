class Symptom < ApplicationRecord
  include Detail::Ext::Knowable
  include Com::Ext::Sequence

  attribute :name, :string
  attribute :content, :string
  attribute :type, :string
  attribute :options, :string
  attribute :code, :string
  attribute :mutable, :boolean, default: true, comment: '是否可变'  # 可变的，支持历史记录
  attribute :primary, :boolean, comment: '主要症状'  # 主要症状，在首页显示
  attribute :physical, :boolean, comment: '生理性的，如身高'
  attribute :bodily, :string
  attribute :effective_duration, :integer

  belongs_to :diagnose, optional: true
  has_many :contents, as: :detail
  has_many :symptom_bodies, dependent: :destroy
  has_many :bodies, through: :symptom_bodies
  has_many :symptom_diagnoses, dependent: :destroy
  has_many :diagnoses, through: :symptom_diagnoses
  has_many :symptom_causes, dependent: :destroy
  has_many :causes, through: :symptom_causes
  has_many :symptom_treats, dependent: :destroy
  has_many :treats, through: :symptom_treats

  validates :name, presence: true

  enum bodily: {
    whole: 'whole',
    special: 'special',
    multiple: 'multiple'
  }

end

=begin

## 症状
每个症状都有值，只是值的表现形式不一样：
1、一个确定的数字；
2、状态枚举；

通用属性：

* options：
* code

=end
