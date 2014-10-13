##### Create New User #####

get '/users/new' do
	@user = User.new
	@round = Round.new
	erb :"users/new"
end

post '/users/new' do
	@user = User.new(params[:user])

	if !@user.save
		return erb :"users/new"
	end

	redirect to '/'
end

