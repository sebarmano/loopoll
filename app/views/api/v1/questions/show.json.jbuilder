json.question do
	json.content @question.content
	json.creator do
		json.id	@question.user.id
		json.name @question.user.name
		json.questions @question.user.questions.count
		json.answers	@question.user.results.count
		json.link	api_v1_user_url(@question.user)
	end
	json.answers @question.answers do |answer|
		json.content answer.content
		json.votes	answer.results.count

		unless answer.results == 0 
			json.users	answer.results do |result|
				json.id result.user_id
				json.name result.user.name
				json.link api_v1_user_url(result.user)
			end
		end
	end
end