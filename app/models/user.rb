class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :answers
  has_and_belongs_to_many :exams
  # validates :email, email: true
  # validates :email, uniqueness: { scope: :session, message: "cannot be used more than one time" }
  after_commit :create_jw_token, on: :create
  has_one :jw_token

  def create_jw_token
    JwtService.new(user: self).build!
  end
end
