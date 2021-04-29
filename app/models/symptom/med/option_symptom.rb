# 选项式的症状，如血型，分为 A/B/O 等
module Med
  class OptionSymptom < Symptom
    has_many :options

  end
end
=begin

类型为单选
* options: 只能选择一个答案；
* option：对应一个值；

=end
