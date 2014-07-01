class Question < ActiveRecord::Base
  validates :content, :duedate, presence: true
  validate :future_due_date
  #TODO: validate that a question has at least 2 answers

  ##for the above, should we just add answers.count >= 2 as 2nd line in valid method below?

  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :results, through: :answers
  accepts_nested_attributes_for :answers,
    reject_if: lambda { |answer| answer['content'].blank? }


  # Validations
  def future_due_date #TODO: test for this validation
    if duedate < Date.today
      errors.add(:duedate, ", poll must end in the future.")
    end
  end
    
  # Methods
  def active
    duedate > Date.today
  end

  def inactive?
    !active
  end

  def owner(user)
    user_id == user.id
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
  # def results_data
  #   results.includes(:answer).group(:answer).count.max {|m| m.answer_id}).answer_id
  # end

  #includes(:posts).where('posts.name = ?', 'example').references(:posts)

  # def results_max
  #   result_data.max {|m| m.answer}).answer
  # end
end
