before do
	if !logged_in?
		redirect to '/'
	end
end


get '/decks' do
	@decks = Deck.all
	#@round = Round.new()
	erb :"decks/index"
end

post '/decks' do
	deck = Deck.find_by(name: params[:submit]) #changed this to find the deck by the name instead of id
	session[:deck_id] = deck.id
	@round = Round.new(deck_id: session[:deck_id], user_id: session[:user_id])
	@round.save
	if @round.save
		session[:round_id] = @round.id
		redirect '/round/' + session[:round_id].to_s
	else
		redirect '/decks'
	end
end

get '/round/:round_id' do
	#deck = Deck.find(session[:round_id][:id])
	@user = User.find(session[:user_id])
	@round = Round.find(session[:round_id])
	#@user.round_id = @round.id
	erb :"rounds/show"
end


post '/round/:round_id/card/:card_id' do
	@card = Card.find(params[:card_id])
	@round = Round.find(session[:round_id])
	if params[:answer] == params[:card_id]
		 session[:card_id] += 1
		 @card.guesses_correct += 1
		 @card.save
	end
	redirect '/round/' + session[:round_id].to_s + '/card' + session[:card_id].to_s
end
