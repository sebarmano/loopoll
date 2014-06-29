class Question < ActiveRecord::Base
  validates :content, :duedate, presence: true
  validate :future_due_date
  #TODO: validate that a question has at least 2 answers

  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :results, through: :answers
  accepts_nested_attributes_for :answers,
    reject_if: lambda { |answer| answer['content'].blank? }

  def future_due_date #TODO: test for this validation
    if duedate < Date.today
      errors.add(:duedate, ", poll must end in the future.")
    end
  end

  def created
    where(user_id: session[:user_id])
  end

  def answered(user)
    results.where(user_id: user.id)
  end

  def answered?(user)
    answered(user).any?
  end

  def self.to_answer_by(user)
    self.results.where.not( user_id: user.id )
  end

  def multiple_choice?
    answers.count > 2
  end

  def days_left
    (duedate - Date.today).to_i
  end

  def result_data
    results.includes(:answer).group(:answer).count
  end
end
