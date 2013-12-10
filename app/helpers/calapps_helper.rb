module CalappsHelper
	def thumbnail_url(calapp)
		if calapp.image.present?
			calapp.image
		else
			calapp.image = 'http://www.advancingjustice-alc.org/sites/asian-law-caucus/files/styles/publication-landing/public/default_images/aj-aai-publication-default-thumbnail_0.gif?itok=8wySC9YR'
		end
	end

	def screenshot1_url(calapp)
		if calapp.screenshot1.present?
			calapp.screenshot1
		else
			calapp.screenshot1 = ''
		end
	end

	def screenshot2_url(calapp)
		if calapp.screenshot2.present?
			calapp.screenshot2
		else
			calapp.screenshot2 = ''
		end
	end

	def screenshot3_url(calapp)
		if calapp.screenshot3.present?
			calapp.screenshot3
		else
			calapp.screenshot3 = ''
		end
	end

	def screenshot4_url(calapp)
		if calapp.screenshot4.present?
			calapp.screenshot4
		else
			calapp.screenshot4 = ''
		end
	end

	def screenshot5_url(calapp)
		if calapp.screenshot5.present?
			calapp.screenshot5
		else
			calapp.screenshot5 = ''
		end
	end

    def avg (app)
        sum = 0.0
        total = 0
        app.reviews.each do |r|
            sum += r.review_rating
            total += 1
        end
        if total == 0
        	return 'No Reviews Yet, Be the first!'
        end
        return sum/total
    end

end