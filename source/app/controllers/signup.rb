get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.new(username: params[:username], password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    erb '/signup'
  end
end
