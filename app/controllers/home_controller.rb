class HomeController < ApplicationController

	def index
		@charities_for_map = Charity.format_for_map
	end

  def how_to
  end

  def what_else
  end
  
end