FactoryGirl.define do
  factory :user do
    email  "factory@test.com"
    password "test"
  end

  factory :question do
  	content "Test question"
  	# answers ['Yes', 'No']
  	user_id 1
  	duedate (DateTime.now + 1.day) 
  end
end