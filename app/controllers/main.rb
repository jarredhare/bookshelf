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

get "/redirect_auth_url" do
  redirect "https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=#{ENV['CLIENT_ID']}&redirect_uri=http://localhost:9393/logged_in&scope=email&state=12345&approval_prompt=force"
end

get "/logged_in" do
  token_response = HTTParty.post("https://accounts.google.com/o/oauth2/token",
    body: {
      code: params[:code],
      client_id: ENV['CLIENT_ID'],
      client_secret: ENV['CLIENT_SECRET'],
      redirect_uri: "http://localhost:9393/logged_in",
      grant_type: "authorization_code"
    })
  google_plus_response = HTTParty.get("https://www.googleapis.com/plus/v1/people/me?access_token=#{token_response["access_token"]}")

  user_email = google_plus_response["emails"].first["value"]
  user_first_name = google_plus_response["name"]["givenName"]
  user_last_name = google_plus_response["name"]["familyName"]

  if user = User.find_by(email: user_email)
    session[:user_id] = user.id
  else
    user = User.create(email: user_email, first_name:user_first_name, last_name: user_last_name)
    session[:user_id] = User.find_by(email: user_email).id
  end
  redirect "/"
end