# ---------- 7 restful routes ------------#

get "/" do 
  # index
end

get "/survey/new" do
  # new
end

post "/survey" do 
  # create
end

get "survey/:id" do
  # show
end

get "survey/:id/edit" do 
  #edit
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
end

post "/login" do
  # find user with that login 
end

# ---------------------------- #

# --------  Register ------------ #
get "/register" do 
  # go to register page
end

post "/register" do
  # create a new user with the params
end
# ------------------------------- #
