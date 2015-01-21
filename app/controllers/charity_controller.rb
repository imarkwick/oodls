class CharityController < ApplicationController

	def index
		@charities = Charity.all
		if charity_signed_in?	
			@current_charity = current_charity
		else
			@current_charity = nil
		end
	end

end
