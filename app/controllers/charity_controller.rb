class CharityController < ApplicationController

	def index
		@charities = Charity.all
		if charity_signed_in?	
			@current_charity = current_charity
		else
			@current_charity = nil
		end
	end

	def edit
		find_id
	end

	def charity_params
		params.require(:charity).permit(:organisation, :description, :logo, :contact_name, :email, :full_address, :postcode)
	end

	def find_id
		@charity = Charity.find(params[:id])
	end

	def destroy
		@current_charity.delete
		flash[:notice] = 'Charity successfully removed'
		redirect_to '/charity'
	end

end
