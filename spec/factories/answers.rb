FactoryBot.define do
  factory :answer do
    user
    question
    option_id { 1 }
  end
end
