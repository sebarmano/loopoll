require 'rails_helper'

describe Question do
  it "has a valid factory" do
    question = create(:question)
    expect(question).to be_valid
  end

  it "is invalid without content" do
    question = build(:question, content: nil)
    expect(question).not_to be_valid
  end 

  it "is invalid without duedate" do
    question = build(:question, duedate: nil)
    expect(question).not_to be_valid
  end   

  it "is valid with a furure duedate" do
    question = create(:question, duedate: Date.today + 1.day)
    expect(question).to be_valid
  end

  it "is invalid without a future duedate" do
    question1 = build(:question, duedate: Date.today)
    question2 = build(:question, duedate: Date.today - 1.day)
    
    expect(question1).not_to be_valid
    expect(question2).not_to be_valid
  end

  it "is active if duedate is today or in the future" do
    question1 = create(:question)
    question1.duedate = Date.today
    question2 = create(:question)
    question2.duedate = Date.today - 1.day

    expect(question1).to be_active
    expect(question2).not_to be_active
  end

  it "is inactive if duedate is in the past" do
    question1 = create(:question)
    question1.duedate = Date.today - 1.day
    question2 = create(:question)
    question2.duedate = Date.today + 1.day

    expect(question1).to be_inactive
    expect(question2).not_to be_inactive
  end

  it "can calculate days to duedate" do
    question = create(:question, duedate: Date.today + 2.days)
    expect(question.days_left).to eq(2)
  end

end
