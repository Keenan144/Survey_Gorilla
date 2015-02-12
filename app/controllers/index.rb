# ---------- 7 restful routes ------------#

get "/logout" do
  session_logout
  redirect ('/')
end

get "/" do
  # index
  puts "GOING HOME YO"
  if session_logged_in?
    puts "USER IS LOGGED IN"
    erb :homepage
  else
    puts "NOT LOGGED IN LOL"
    erb :index
  end
end

get "/homepage" do

  erb :homepage
end

post "/homepage" do

  erb :homepage
end

get "/survey/new" do
  # new
  erb :new_survey
end

post "/survey" do
  # create
end

get "survey/:id" do
  # show
  erb :single_survey
end

get "survey/:id/edit" do
  #edit
  erb :edit_survey
end

put "survey/:id" do
  # update
end

delete "survey/:id" do
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
  puts "printing username: #{params[:email]}"
  puts "printing pw: #{params[:password]}"
  session_authenticate params[:email], params[:password]
 if @user != nil #&& @user.authenticate(params[:password])
      #session_set_current_user(@user)
      #redirect to their profile page
      redirect('/')
    else
      #erb :login
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
