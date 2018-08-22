class UserAnswerService
  attr_accessor :user_selected_option

  def initialize user_selected_option
    @user_selected_option = user_selected_option
  end

  def build_user_answer!
    UserAnswer.create(
      question_id: @user_selected_option.question_id,
      option_id: @user_selected_option.id
    )
  end
end