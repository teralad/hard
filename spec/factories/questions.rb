FactoryBot.define do
  factory :question do
    chapter
    name { "Who are you?"}
    correct_option_id { 1 }
  end
end
