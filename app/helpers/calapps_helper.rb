module CalappsHelper
	def thumbnail_url(calapp)
		if calapp.image.present?
			calapp.image
		else
			calapp.image = 'http://www.advancingjustice-alc.org/sites/asian-law-caucus/files/styles/publication-landing/public/default_images/aj-aai-publication-default-thumbnail_0.gif?itok=8wySC9YR'
		end
	end


end