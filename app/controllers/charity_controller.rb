class CharityController < ApplicationController

	def index
		@charities = Charity.all
		if charity_signed_in?	
			@charity = current_charity
		else
			@charity = nil
		end
	end

	def new
	end

	def create
		@charity = Charity.create(charity_params)
		redirect_to '/charity'
	end

	def edit
		@charity = Charity.find(params[:id])
	end

	def charity_params
		params.require(:charity).permit(:organisation, :description, :logo, :contact_name, :email, :full_address, :postcode)
	end

	def find_id
		@charity = Charity.find(params[:id])
	end

end
