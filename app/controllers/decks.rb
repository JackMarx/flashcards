
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
		redirect '/rounds/' + session[:round_id].to_s
	else
		redirect '/decks'
	end
end


