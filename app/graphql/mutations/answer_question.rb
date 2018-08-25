class Mutations::AnswerQuestion < Mutations::BaseMutation
	include Questionable
	type Types::AnswerResultType

	argument :question_id, Integer, required: true
	argument :option_id, Integer, required: false

	def resolve(question_id:, option_id:)
		user_id = context[:user_id]
		create_answer(question_id: question_id, option_id: option_id, user_id: user_id)
	end
end