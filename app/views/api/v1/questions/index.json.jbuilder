json.questions @questions do |question|
	json.content question.content
	json.link api_v1_question_url(question)
	json.creator do
		json.id question.user.id
		json.name question.user.name
		json.questions question.user.questions.count
		json.answers	question.user.results.count
		json.link api_v1_user_url(question.user)
	end
	json.answers question.answers do |answer|
		json.id	answer.id
		json.content answer.content
		json.votes answer.results.count
	end 
end