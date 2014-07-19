class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable 
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :questions
  has_many :results
  has_many :answers, through: :results

  def self.from_omniauth(auth)
    # binding.pry
  where(auth.slice(:provider, :uid)).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.nickname

    end
  end
end

