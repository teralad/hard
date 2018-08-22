class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :answers
  has_and_belongs_to_many :exams
  # validates :email, email: true
  # validates :email, uniqueness: { scope: :session, message: "cannot be used more than one time" }

  def have_answered_the_question?(question)
    question.answers.where(user_id: id).count >= 1
  end
  
  def answer_question(question, answer)
    participant_answers.build(answer: answer)
    add_points() if answer.correct?
    save()
    answer.correct? 
  end

  def add_points
    self.points = self.points + 1
  end

  def number_of_correct_answers
    participant_answers.joins(:answer).where({answers: {correct: true}}).count
  end

  def number_of_wrong_answers
    participant_answers.joins(:answer).where({answers: {correct: false}}).count
  end

  private

  def generate_authorization_key
		 begin
    		self.authorization_key = SecureRandom.hex(8)
  	 end while self.class.exists?(authorization_key: authorization_key)
	end

	def generate_authorization_password
		 begin
    		self.authorization_password = SecureRandom.hex(8)
  	 end while self.class.exists?(authorization_password: authorization_password)
	end

  def grant_access_to_session_channels
    LiveQuiz::PubNub.client.grant(channel: self.session.server_channel, auth_key: self.authorization_password ,  read: true, write: false){|envelope|}
    LiveQuiz::PubNub.client.grant(channel: self.session.client_channel, auth_key: self.authorization_password ,  read: false, write: true){|envelope|}
    LiveQuiz::PubNub.client.grant(:channel => self.session.chat_channel, presence: self.session.chat_channel, auth_key: self.authorization_password){|envelope|}
  end

  def revoke_access_to_session_channels
    LiveQuiz::PubNub.client.revoke(:channel => self.session.server_channel, auth_key: self.authorization_password){|envelope|}
    LiveQuiz::PubNub.client.revoke(:channel => self.session.client_channel, auth_key: self.authorization_password){|envelope|} 
    LiveQuiz::PubNub.client.revoke(:channel => self.session.chat_channel, presence: self.session.chat_channel, auth_key: self.authorization_password){|envelope|}
  end

end
