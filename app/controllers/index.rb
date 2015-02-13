# ---------- 7 restful routes ------------#

get "/" do 
  # index
  puts "HIIII"
  erb :index
end

get "/surveys" do 
  @survey = Survey.all

  erb :surveys
end


get "/survey/new" do
  # new
  erb :new_survey
end



post "/survey" do 
  # create
  @survey = Survey.create(title: params[:title])
  @id = @survey.id
  p @id
  redirect "/surveys"
end

#get "survey/:id" do
  # show
#  puts "Hello world"
#  erb :single_survey
#end
get "/survey/:id" do
  @survey = Survey.find(params[:id])
  erb :single_survey
end


post "/survey/:id/questions" do 
  @survey = Survey.find(params[:id])
  @question = @survey.questions.create(title: params[:title])

  redirect "/survey/#{@survey.id}"
end

get "/survey/:s_id/questions/:id" do 
  @survey = Survey.find(params[:s_id])
  @question = Question.find(params[:id])
  
  erb :single_question
end


post "/survey/:s_id/questions/:q_id/response" do 
  @survey = Survey.find(params[:s_id])
  @question = Question.find(params[:q_id])
  @resp = @question.responses.create(answer: params[:answer])

  str = params[:s_id].to_s
 # puts str
  redirect "/survey/#{str}"
end

get "/survey/:s_id/questions/:q_id/response/:id" do
  @survey = Survey.find(params[:s_id])
  @question = Question.find(params[:q_id])
  @response = Response.find(params[:id])


  erb :single_question
end
# get "/questions" do 
#   @question = Question.all
#   erb :questions
# end


get "/survey/:id/edit" do 
  #edit
  erb :edit_survey
end

put "/survey/:id" do 
  # update
end

delete "/survey/:id" do
  # delete
end
# -------------------------------------- #




















# --------  login ------------ #

get "/login" do 
  # go to login page
  erb :index
end

post "/login" do
  # find user with that login 
    @user = User.find_by(email: params[:email])
 if @user != nil #&& @user.authenticate(params[:password])
      # session_set_current_user(@user)
      #redirect to their profile page
      redirect('/profile')
  else
  erb :login
 end

end

# ---------------------------- #

# --------  Register ------------ #
get "/register" do 
  # go to register page
  erb :register
end

post "/register" do
  # create a new user with the params
  @new_user = User.create(email: params[:email], password: params[:password])
  if @new_user   #.valid?
      session_set_current_user(@new_user)
      redirect('/profile')
  else
    erb :index
  end
end
# ------------------------------- #
