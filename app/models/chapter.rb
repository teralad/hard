class Chapter < ApplicationRecord
    has_many :questions
    belongs_to :topic
end
