class HomeController < ApplicationController

	def index
		@charities = Charity.all
		@hash = {}
		@coords = @charities.each { |charity|
			@hash[charity.id] = [charity.latitude, charity.longitude] 
		}
		@data = @hash.to_json
	end
	
end
