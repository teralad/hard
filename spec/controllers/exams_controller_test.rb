require 'rails_helper'

describe "ExamsController" do
    before(:each) do
        @controller = ExamsController.new
        sign_in(User.first)
    end

    context 'exam' do
        it 'gives exam summary with signed in user' do
            get :exam_summary, {:format => 'json'}
            assert_equal response.status.to_i, 200
            data = JSON.parse(response.body)
            expect(data.first.keys.uniq.first).to eq 'summary'
            assert_equal (["unanswered_percent", "skipped_percent", "incorrect_percent", "correct_percent", "total_questions"]-data.first['summary'].keys), []
        end

        it "wont give exam summary when not signed in" do
            sign_out(User.first)
            get :exam_summary, {:format => 'json'}
            expect(response.status).not_to eq 200
        end
    end

    after(:each) do
        sign_out(User.first)
    end
end
