class SampleSymptom < ApplicationRecord
  attribute :sign_name, :string
  attribute :sign_type, :string
  attribute :value, :string

  belongs_to :sample
  belongs_to :symptom
  belongs_to :symptom_option

end

=begin

# 体重等记录

user_id
sign_id

sign_name
sign_type

value

=end
