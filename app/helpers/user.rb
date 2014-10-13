def current_user
	if session[:user_id]
		@current_user ||= User.find_by_id(session[:user_id])
	end
end

def logged_in?
	!current_user.nil?
end

def display_error(object, field)
  if object.errors[field].any?
    "error"
  end
end

def error?(object, field)
  object.errors[field].any?
end
