module UsersHelper

	#returns the Gravatar
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_id}.png"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end

	def image_for(user)
		image_url = "http://orig02.deviantart.net/a56c/f/2012/026/0/7/render__naruto_by_naruhinabrazil-d4norui.png"
		image_tag(image_url, alt: user.name, class:"gravatar")
	end

end
