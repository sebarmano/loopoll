class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable 
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  has_secure_password
  validates :name, :email, :password_digest, presence: true
  validates :email, uniqueness: true

  has_many :questions
  has_many :results
  has_many :answers, through: :results
end
