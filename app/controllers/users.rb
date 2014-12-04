get "/users/new" do
  erb :new_user_form
end

get "/users/:id" do
  @user = User.find(params[:id])
  @books = @user.books
  erb :library
end

post "/users" do
  # p params
  if User.find_by(email: params[:email])
    "That user already exists."
    redirect "/users/new"
  else
    User.create(params)
    redirect "/"
  end
end

post '/login' do
  if user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
    end
  end
  redirect "/"
end

get "/logout" do
  session.clear
  redirect "/"
end


