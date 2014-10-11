get '/decks' do 
	if !logged_in?
		redirect to '/'
	end
	@decks = Deck.all 

	erb :"decks/index"
end

get '/decks/:id' do
	if !logged_in?
		redirect to '/' 
	end
	
	deck = Deck.find_by_id(params[:id])
	user = User.find_by_id(session[:user_id])

	round = Round.create(deck: deck, user: user)
	user.current_round = round.id 
	user.save 

	redirect to "/rounds/#{round.id}"
end

