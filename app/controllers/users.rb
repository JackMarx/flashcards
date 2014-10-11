##### Create New User #####

get '/users/new' do
	if logged_in?
		redirect '/'
	end
	@user = User.new

	erb :"users/new"
end

post '/users/new' do 
	@user = User.new(params[:user])

	if !@user.save
		@error = @user.first_error
		return erb :"users/new"
	end

	redirect to '/'
end

get '/users/:id' do 
	@user = User.find_by_id(session[:user_id])

	erb :"users/show"
end

