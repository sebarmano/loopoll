require 'rails_helper'

describe User do
  it "has a valid factory" do
    user = create(:user)
    expect(user).to be_valid
  end

  it "is invalid without content" do
    user = build(:user, email: nil)
    expect(user).not_to be_valid
  end 

  it "is invalid without duedate" do
    user = build(:user, password: nil)
    expect(user).not_to be_valid
  end   

  it "is valid with a furure duedate" do
    user = create(:user, name: nil)
    expect(user).to be_valid
  end
end