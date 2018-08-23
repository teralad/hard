class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist

         has_many :answers
  has_and_belongs_to_many :exams
  # validates :email, email: true
  # validates :email, uniqueness: { scope: :session, message: "cannot be used more than one time" }

end
