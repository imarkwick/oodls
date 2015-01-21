class HomeController < ApplicationController

	def index
		@charities = Charity.all
		@hash = {}
		@array = []
		@coords = @charities.each { |charity|
			@array << [charity.id, charity.latitude, charity.longitude] 
		}
		@data = @array
	end
	
end
