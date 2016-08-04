module UsersHelper

	#returns the Gravatar
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_id}.png"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end

	def image_for(user)
		if user.id == 2
			image_url = "http://orig02.deviantart.net/a56c/f/2012/026/0/7/render__naruto_by_naruhinabrazil-d4norui.png"
			#image_tag(image_url, alt: user.name, class:"gravatar")
		elsif user.id == 1
			image_url = 'https://pbs.twimg.com/profile_images/647507270029418501/v0FpaptX.jpg'
			#image_tag(image_url, alt: user.name, class: "gravatar")
		else
			image_url = 'http://wallpaper.sc/en/ipad/wp-content/uploads/2014/10/ipad-2048x2048-thumbnail_00908-256x256.jpg'
			#image_tag(image_url, alt: user.name, class: "gravatar")
		end
		image_tag(image_url, alt: user.name, class: "gravatar")
	end

end
