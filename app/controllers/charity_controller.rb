class CharityController < ApplicationController

	def index
		@charities = Charity.all
		if charity_signed_in?	
			@current_charity = current_charity
		else
			@current_charity = nil
		end
		
	end

	# def reqs_array
	# 	food_reqs = %w(tins dried_goods coffee_tea fresh_fruit_veg snacks jars_condiments cereals cooking_ingredients drinks uht_milk)

	# 	food_reqs.inject([]) do |memo, col|
	# 		if (charity.send(col) == '1')
	# 			memo << col.humanize
	# 		end
	# 		memo
	# 	end
	# end

end
