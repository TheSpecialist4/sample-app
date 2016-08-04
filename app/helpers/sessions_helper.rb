module SessionsHelper

	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def current_user?(user)
		user == current_user
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	# for friendly forwarding..redirecting unsigned user
	# to their profile when edit is clicked
	def redirect_back_or(default)
		# session hashset built in in rails..instance of
		# cookies variable in browser which expires upon
		# browser close
		# rediects to session[:return_to] URL if it exists
		# or default otherwise
		redirect_to(session[:return_to] || default)
		# deleted because future sign ins should not redirect
		# to other user's page
		session.delete(:return_to)
	end

	# for friendly forwarding
	def store_location
		session[:return_to] = request.fullpath
	end

	def get_signed_in_user
		unless signed_in?
			store_location
			redirect_to signin_path, notice: "Please sign in"
		end
	end
end
