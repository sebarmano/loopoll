json.id	@user.id
json.name @user.name
json.questions @user.questions.count
json.answers	@user.results.count

json.questions @user.questions do |question|
	json.id	question.id
	json.content question.content
	json.link api_v1_question_url(question)
end

json.answers @user.results do |result|
	json.question_id	result.answer.question_id
	json.question_content result.answer.question.content
	json.link api_v1_question_url(result.answer.question)
	json.result_id	result.id
	json.result_content result.answer.content
end
