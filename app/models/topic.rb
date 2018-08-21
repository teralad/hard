class Topic < ApplicationRecord
    has_many :chapters
    belongs_to :subject
end
