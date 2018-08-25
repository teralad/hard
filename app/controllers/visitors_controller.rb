class VisitorsController < ApplicationController

    def index
        @user = current_user
        if !user_signed_in?
            redirect_to new_user_session_path
        else
            redirect_to questions_path(id: rand(1..9), name: ['subject','topic','chapter'].sample)
        end
    end
end
