class UserAnswer < ApplicationRecord
    self.table_name = "answers"
    belongs_to :user
    belongs_to :question
end
