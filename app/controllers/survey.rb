get "/survey/:id/take" do 
	puts "Trying to edit/view survey ##{params[:id]}"
	survey = Survey.find(params[:id])
	@survey_name = survey.title
	@questions = survey.questions
	@id = params[:id].to_s
	erb :take_survey
end

post "/survey/:id/take/submit" do
	survey = Survey.find(params[:id])
	puts "Submitting survey: " + survey.title
	puts "=" * 30
	5.times {puts}

	survey.questions.each do |question|
		question_text = question.title.chop + "_button"
		response_text = params[question_text.to_sym]

		response = question.responses.find_by(answer: response_text)	
		puts "Response id: " + response.id.to_s
		puts response.answer
		curCount = response.count
		if curCount == nil
			response.update(count: 1)
		else
			response.update(count: curCount+1)
		end
	end
	redirect "/survey/#{params[:id]}/take/finished"
end

get "/survey/:id/take/finished" do
	@url = "/"
	@survey_title = Survey.find(params[:id]).title
	erb :survey_finished
end




