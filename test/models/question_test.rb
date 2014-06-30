require 'test_helper'

class QuestionTest < ActiveSupport::TestCase


    test "question due date in the future is valid" do
      q1 = Question.create(
              content: "test1",
              duedate: DateTime.now + 1.day
              )
      assert q1.valid?
      refute q1.errors[:duedate].any?
    end

    test "question due date in the past is invalid" do
      q2 = Question.create(
              content: "test2",
              duedate: DateTime.now - 1.day
              )
      refute q2.valid?
      assert q2.errors[:duedate].any?
    end


#didn't add tests for valid & invalid b/c these would only test code works?
#or, do we need those two also?


  test "owner is user" do
      user = User.create(
        name:"test",
        email:"test@test",
        password: "test",
        password_confirmation: "test"
      )
      q1 = Question.create(
          content: "test",
          duedate: Date.today + 2.days,
          user_id: 1
      )
     assert_equal 1, q1.user_id
    end

    test "user can't answer a question twice" do
      user1 = User.create(
          name:"test",
          email:"test@test",
          password: "test",
          password_confirmation: "test"
      )
      user2 = User.create(
          name:"test",
          email:"test@test",
          password: "test",
          password_confirmation: "test"
      )
      q1 = Question.create(
          content: "test",
          duedate: DateTime.now + 2.days,
          user_id: 2
      )
      answer1 = Answer.create(
          question_id: 1,
          content: "test"
      )
      answer2 = Answer.create(
          question_id: 1,
          content: "test"
      )
      result1 = Result.create(
          user_id: 1,
          answer_id: 1
      )
      result2 = Result.create(
          user_id: 1,
          answer_id: 1
      )
      result3 = Result.create(
          user_id: 1,
          answer_id: 1
      )
      assert Results.user_id.find(1).count <= 1

    end

    test "questions to answer are not owned by user" do
      user1 = User.create(
          name:"test",
          email:"test@test",
          password: "test",
          password_confirmation: "test"
      )
      user2 = User.create(
          name:"test",
          email:"test@test",
          password: "test",
          password_confirmation: "test"
      )
      q1 = Question.create(
          content: "test",
          duedate: DateTime.now + 2.days,
          user_id: user1.id
      )
      answer = Answer.create(
          question_id: q1.id,
          content: "test"
      )
      result1 = Result.create(
          user_id: user2.id,
          answer_id: answer.id
      )

      assert q1.id != user_id
      #not sure how to change to entirely to prove unanswered doesn't contain self
    end

    test "questions are multiple choice if > 2 answers" do
      user1 = User.create(
          name:"test",
          email:"test@test",
          password: "test",
          password_confirmation: "test"
      )
      q1 = Question.create(
          content: "test",
          duedate: Date.today + 2.days,
          user_id: 1
      )
      3.times do
        answer = Answer.create(
          question_id: q1.id,
          content: "test"
      )
      end
      q2 = Question.create(
          content: "test",
          duedate: Date.today + 2.days,
          user_id: 1
      )
      4.times do
        answer = Answer.create(
            question_id: q2.id,
            content: "test"
        )
        end
      q3 = Question.create(
          content: "test",
          duedate: Date.today + 2.days,
          user_id: 1
      )
      2.times do
        answer = Answer.create(
          question_id: q3.id,
          content: "test"
      )
      end
      q4 = Question.create(
          content: "test",
          duedate: Date.today + 2.days,
          user_id: 1
      )
        answer = Answer.create(
            question_id: q4.id,
            content: "yes"
        )
        answer = Answer.create(
            question_id: 4,
            content: "no"
        )
      # binding.pry
      assert q1.multiple_choice?
      assert q2.multiple_choice?
      refute q3.multiple_choice?
      refute q4.multiple_choice?
    end



    # def created
    #   where(user_id: @current_user)
    # end
    #
    # def answered
    #   results.where(user_id: @current_user)
    # end
    #
    # def to_answer
    #   where.not(user_id: @current_user)
    # end
end