class HomeController < ApplicationController

	def index
		@charities_for_map = Charity.format_for_map
	end
	
	def organisation
		@organisation = Charity.find(params[:organisation])
	end

	def requirements
		@requirements = Charity.requirements_array
	end

	def hours
		@opening_hours = Charity.find
	end

end