get "/" do
  if current_user
    redirect "/users/#{current_user.id}"
  else
    erb :index
  end
end


get "/session_view" do
  erb :session_view, :layout => false
end