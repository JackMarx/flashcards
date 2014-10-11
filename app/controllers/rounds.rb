get '/rounds/:id' do 
	@round = Round.find_by_id(params[:id])
	user = @round.user

	if !(logged_in? && current_user == user)
		redirect to "/"
	end

	erb :"round/show"
end

post '/rounds/:id' do 
	user = User.find_by_id(session[:user_id])
	@round = Round.find_by_id(user.current_round)
	@card = Card.find_by_id(params[:question_id])

	erb :"rounds/show"
end