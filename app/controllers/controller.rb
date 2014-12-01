get "/" do
  if current_user
    redirect "/users/#{current_user.id}"
  else
    erb :index
  end
end

get "/users/new" do
  erb :new_user_form
end

get "/users/:id" do
  @user = User.find(params[:id])
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
      redirect '/session_view'
    end
  else
      redirect '/'
  end
end

get "/session_view" do
  erb :session_view, :layout => false
end


