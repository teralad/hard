require 'rails_helper'
describe "QuestionsController" do
    let(:user) { User.first }
    before(:each) do
        @controller = QuestionsController.new
        sign_in user
    end

    context 'questions' do
        it 'displays questions when signed in' do
            get :index, {format: :json}
            assert_equal response.status.to_i, 200
            data = JSON.parse(response.body)
            assert_equal (["name", "options", "url"] - data.first.keys), []
            expect(data.first['options'].length).to eq 4
            response.header['Content-Type'].should include 'application/json'
            assert_equal (['question_id','name'] - data.first['options'].first.keys), []
        end

        it 'wont display questions when not signed in' do
            sign_out user
            get :index, {:format => 'json'}
            expect(response.status).not_to eq 200
        end
    end

    after(:each) do
        sign_out user
    end
end