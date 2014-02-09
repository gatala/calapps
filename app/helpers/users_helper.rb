module UsersHelper
	def avatar_url(user)
		if user.image.present?
			user.image
		else
			gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
			user.image = 'http://www.advancingjustice-alc.org/sites/asian-law-caucus/files/styles/publication-landing/public/default_images/aj-aai-publication-default-thumbnail_0.gif?itok=8wySC9YR'
		end
	end
end
