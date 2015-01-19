class CharityController < ApplicationController

	def index
		@charities = Charity.all
	end

	def new
	end

	def create
		@charity = Charity.create(charity_params)
		redirect_to '/charity'
	end

	def charity_params
		params.require(:charity).permit(:organisation, :description, :logo, :contact_name, :email, :full_address, :postcode)
	end

	def find_id
		@charity = Charity.find(params[:id])
	end

end
