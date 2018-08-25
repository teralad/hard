require 'rails_helper'

describe "AnswersController", :type => :controller do
    let(:user) { User.first }
    before(:each) do
        @controller = AnswersController.new
        sign_in user
    end

    context 'answers' do
        it 'creates answer when signed in' do
            Answer.delete_all
            params = { format: "json", question_id: 1, user_id: user.id, option_id: nil }
            post :create, params: params
            assert_equal response.status.to_i, 201
            assert_equal Answer.count, 1
            data = JSON.parse(response.body)
            assert_equal (["id", "user_id", "option_id", "question_id", "url"]-data.keys), []
        end
    end
    after(:each) do
        sign_out user
    end
end
