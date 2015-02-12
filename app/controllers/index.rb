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
  erb :login
end

post "/login" do
  # find user with that login 
end

# ---------------------------- #

# --------  Register ------------ #
get "/register" do 
  # go to register page
  erb :register
end

post "/register" do
  # create a new user with the params
end
# ------------------------------- #
