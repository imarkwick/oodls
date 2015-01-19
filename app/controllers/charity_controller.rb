class CharityController < ApplicationController

	def index
		@charities = Charity.all
	end

	def new
	end

	def create
		@charity = Charity.create(params[:charity])
		redirect_to '/charity'
	end

	# def charity_params
	# 	params.require(:charity).permit(:organisation)
	# end

end
