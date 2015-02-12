# ---------- 7 restful routes ------------#

get "/" do 
  # index
  erb :index
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
 if @user != nil #&& @user.authenticate(params[:password])
      #session_set_current_user(@user)
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
