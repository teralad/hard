class Question < ApplicationRecord
    has_many :answers
    has_many :options
    has_one :correct_option, class: 'Option', foreign_key: :option_id

end
