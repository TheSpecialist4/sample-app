class SessionsController < ApplicationController

	def new
	end

	def create
		# same as params(session(email)). i.e. params is a hashset
		# of session, and session is a hashset of emails and passwords
		user = User.find_by_email(params[:session][:email])
		# all objects in ruby are true other than false and nil
		# hence if user.authenticate returns true, and a valid user, then
		# if condition is true
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_back_or root_path
		else
			# flash only gets called on the first request.
			# but render isnt a request, hence flash is called twice currently
			# hence flash.now is used
			#flash[:error] = 'Invalid email/password combo'
			flash.now[:error] = 'Invalid email/password combo'
			# renders new.html sign in form
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end

end
