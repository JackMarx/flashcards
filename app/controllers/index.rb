get '/' do
	if logged_in?
	 redirect '/decks' # Could change
	end
  erb :index
end
