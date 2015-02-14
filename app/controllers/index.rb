# ---------- 7 restful routes ------------#


get "/logout" do
  session_logout
  redirect ('/')
end

get "/" do
  # index
  # erb :index
  if session_logged_in?
    erb :homepage
  else
    erb :index
  end
end

get "/homepage" do

  erb :homepage
end

post "/homepage" do

  erb :homepage
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

# get "/login" do
#   # go to login page
#   puts "GET LOGIN"
#   erb :index
# end

post "/login" do
  # find user with that login
  @user = User.find_by(email: params[:email])
  puts "printing username: #{params[:email]}"
  puts "printing pw: #{params[:password]}"
  session_authenticate params[:email], params[:password]
  if @user #&& @user.authenticate(params[:password])
    session_set_current_user(@user)
    puts "Login success"
    redirect('/')
  else
    puts "Error"
    session[:errors] = 'invalid login credentials'
    redirect('/')
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
  if @new_user.valid?
    session_set_current_user(@new_user)
    redirect('/')
  else
    erb :index
  end
end
# ------------------------------- #
