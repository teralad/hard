class Exam < ApplicationRecord
    has_many :subjects
    has_and_belongs_to_many :users
    def calc_score
        # user.answers.group(:)
    end
    
end
