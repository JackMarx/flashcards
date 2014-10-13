
get '/decks' do
	if !logged_in?
		redirect to '/'
	end
	@decks = Deck.all
	#@round = Round.new()
	erb :"decks/index"
end

post '/decks' do
	deck = Deck.find_by(name: params[:submit]) #changed this to find the deck by the name instead of id
	session[:deck_id] = deck.id
	@round = Round.new(deck_id: session[:deck_id], user_id: session[:user_id])
	if @round.save
		session[:round_id] = @round.id
		@card = Card.find(1)
		session[:card_id] = @card.id
		redirect '/round/' + session[:round_id].to_s
	else
		redirect '/decks'
	end
end

get '/round/:round_id' do
	@user = User.find(session[:user_id])
	@round = Round.find(session[:round_id])
	@deck = Deck.find(session[:deck_id])
	@cards = @round.cards
	@card = Card.find(session[:card_id])
	erb :"rounds/show"
end


post '/round/:round_id' do
	@round = Round.find(session[:round_id])
	@card = Card.find(session[:card_id])
	if params[:answer].downcase == @card.answer.downcase
		 @round.correct_guesses = (@round.correct_guesses + 1)
		 @round.save
		 redirect '/round/' + session[:round_id].to_s
	else
		redirect '/round/' + session[:round_id].to_s
	end
	session[:card_id] += 1
end
