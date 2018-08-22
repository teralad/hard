class Question < ApplicationRecord
    has_many :answers
    has_and_belongs_to_many :options
    has_one :correct_option, class: 'Option', foreign_key: :correct_option_id

end
