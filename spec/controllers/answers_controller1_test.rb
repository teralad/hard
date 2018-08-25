describe "Answers#create" do
    let(:user) { User.first }
    before(:each) do
        @controller = AnswersController.new
        sign_in user
    end

    context "update answers instead of creating duplicate" do
        it 'should update answer when option is changed for same question by same user' do
            assert_equal Answer.count, 1
            params = { format: 'json', question_id: 1, user_id: user.id , option_id: 1}
            post :create, params: params
            assert_equal response.status.to_i, 201
            assert_equal Answer.count, 1
            data = JSON.parse(response.body)
            assert_equal data['option_id'], 1
            assert_equal Answer.first.option_id, 1
            assert_equal (["id", "user_id", "option_id", "question_id", "url"]-data.keys), []
        end
    end

    describe "should" do
        it 'throw error when no user' do
            sign_out user
            params = { format: 'json', question_id: 1, option_id: 1}
            post :create, params: params
            assert_equal response.status, 400
            data = JSON.parse(response.body)
            assert_equal (["errors"]-data.keys), []
        end
    end

    after(:each) do
        sign_out user
    end
end