post '/login' do
	user = User.find_by_email(params[:user][:email])
	if user && user.authenticate(params[:user][:password])
		session[:user_id] = user.id
		redirect '/decks'
	else
    @message = "Whoops. You're missing something. Try again."
		erb :index
	end
end

get '/logout' do
  session.delete(:deck_id)
  session.delete(:round)
  session.delete(:round_id)
  session.delete(:deck)
  session.delete(:user_id)
  redirect '/'
end

get '/session-viewer' do
  session.inspect
end
