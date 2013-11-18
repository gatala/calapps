module UsersHelper
	def avatar_url(user)
		if user.image.present?
			user.image
		else
			gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
			user.image = 'http://gravatar.com/avatar/#{gravatar_id}.png'
		end
	end
end
