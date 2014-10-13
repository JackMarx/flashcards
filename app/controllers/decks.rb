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
	session[:deck] = deck
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
	@deck = Deck.find(session[:deck_id])
	@cards = session[:deck].cards
	@card = session[:deck].cards.first#@deck.cards.pop
	p @deck.cards
	#@user.round_id = @round.id
	erb :"rounds/show"
end


post '/round/:round_id' do
	@deck = Deck.find(session[:deck_id])
	@card = Card.find_by(hint: session[:deck].cards.first.hint)
	@round = Round.find(session[:round_id])
	@round.cards.find(@card[:id]).destroy
	if params[:answer] == params[:card_id]
		 @round.correct_guesses =  (@round.correct_guesses + 1)
		 @round.save
	end
	redirect '/round/' + session[:round_id].to_s
end
