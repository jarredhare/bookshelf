get '/' do
  redirect '/login' unless session[:user_id]

  session[:workout_views] = 0 unless session[:workout_views]
  session[:workout_views] += 1
  @user = User.find(session[:user_id])
  @workouts = Workout.all
  erb :index
end

get '/workouts/new' do
  erb :new
end

get '/workouts/:id' do
  @user = User.find(session[:user_id])
  @workout = Workout.find(params[:id])
  erb :show
end

post '/workouts/new' do
  Workout.create(params[:workout])
  p "hello checking route"
  redirect to '/' , :layout => false
end

delete '/workouts/:id' do
  @workout = Workout.find(params[:id])
  @workout.destroy
  redirect to '/'
end

get '/workouts/:id/edit' do
  @workout = Workout.find(params[:id])
  erb :edit
end

put '/workouts/:id' do
  @workout = Workout.find(params[:id])
  @workout.update(params[:workout])
  redirect to "/workouts/#{@workout.id}"
end

