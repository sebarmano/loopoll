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

  def most_answered
    most_answered = result_data.max_by { |_q, a| a }
    most_answered[0]
  end

  # def results_data
  #   results.includes(:answer).group(:answer).count.max {|m| m.answer_id}).answer_id
  # end

  #includes(:posts).where('posts.name = ?', 'example').references(:posts)

  # def results_max
  #   result_data.max {|m| m.answer}).answer
  # end


  def tweet_question(token, secret, question)
    twitter_access_token = twitter_token(token, secret)
    status = (question.content).truncate(137)
    twitter_access_token.post("/1.1/statuses/update.json", :params => { 'status' => status })

    #set the tweet status to the question content and answers, add a loopoll hash
  end

  def twitter_token(twitter_access_token, twitter_access_secret)
    return @twitter_token if @twitter_token
    twitter_client = OAuth2::Client.new(Rails.application.secrets.twitter_key,
                                        Rails.application.secrets.twitter_secret,
           @twitter_token = OAuth2::AccessToken.new(twitter_client, twitter_access_token, twitter_access_secret)

  end

  def to_s
   "#{name} <#{email}>"
   end
end
