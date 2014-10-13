get '/rounds/:round_id' do
	@user = User.find(session[:user_id])
	@round = Round.find(session[:round_id])
	@deck = Deck.find(session[:deck_id])
	@cards = @round.cards
	@card = Card.find(session[:card_id])
	erb :"rounds/show"
end


post '/rounds/:round_id' do
	@round = Round.find(session[:round_id])
	@card = Card.find(session[:card_id])
	if params[:answer].downcase == @card.answer.downcase
		 @round.correct_guesses = (@round.correct_guesses + 1)
		 @round.save
	end
	session[:card_id] = session[:card_id] + 1
	redirect '/rounds/' + session[:round_id].to_s
end
