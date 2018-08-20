class VisitorsController < ApplicationController

    def index
        @user = current_user
        if !user_signed_in?
            redirect_to new_user_session_path
        else
            redirect_to user_summary_path
        end
    end
end
