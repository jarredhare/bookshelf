get '/' do
  @workouts = Workout.all

  session[:workout_views] = 0 unless session[:workout_views]
  session[:workout_views] += 1

  erb :index
end

get '/workouts/new' do
  erb :new
end

get '/workouts/:id' do
  @workout = Workout.find(params[:id])
  erb :show
end

post '/workouts/new' do
  # raise params.inspect to see what's being passed
  Workout.create(params[:workout])
  redirect to '/'
end

delete '/workouts/:id' do
  @workout = Workout.find(params[:id])
  @workout.destroy
  redirect to '/workouts'
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
