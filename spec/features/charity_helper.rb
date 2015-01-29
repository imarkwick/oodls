module CharityHelper

	def sign_up
		visit '/'
		click_link 'Add a Charity'
		fill_in 'Organisation Name', with: 'Crisis'
		fill_in 'Organisation Description (max 140 characters)', with: 'We are crisis and we help the homeless'
		fill_in 'Contact Name', with: 'contact'
		fill_in 'Contact\'s Email Address', with: 'contact@email.com'
		fill_in 'Donation Center Address', with: 'i live here'
		page.check('Tins')
		fill_in 'Postcode', with: 'SW15 7HH'
		fill_in 'Password', with: 'testtest'
		fill_in 'Password Confirmation', with: 'testtest'
		click_button 'Sign Up'
	end

	def sign_up_with_reqs
		visit '/'
		click_link 'Add a Charity'
		fill_in 'Organisation Name', with: 'Crisis'
		fill_in 'Organisation Description (max 140 characters)', with: 'We are crisis and we help the homeless'
		fill_in 'Contact Name', with: 'contact'
		fill_in 'Contact\'s Email Address', with: 'contact@email.com'
		fill_in 'Donation Center Address', with: 'i live here'
		fill_in 'Postcode', with: 'SW15 7HH'
		page.check('Tins')
		fill_in 'Password', with: 'testtest'
		fill_in 'Password Confirmation', with: 'testtest'
		click_button 'Sign Up'
	end

	def sign_up_with_website
		visit '/'
		click_link 'Add a Charity'
		fill_in 'Organisation Name', with: 'Crisis'
		fill_in 'Organisation Description (max 140 characters)', with: 'We are crisis and we help the homeless'
		fill_in 'Website Address', with: 'http://www.crisis.org.uk'
		fill_in 'Contact\'s Email Address', with: 'contact@email.com'
		fill_in 'Donation Center Address', with: 'i live here'
		fill_in 'Postcode', with: 'SW15 7HH'
		fill_in 'Password', with: 'testtest'
		fill_in 'Password Confirmation', with: 'testtest'
		click_button 'Sign Up'
	end

	def sign_up_with_opening_hours
		visit '/'
		click_link 'Add a Charity'
		fill_in 'Organisation Name', with: 'Crisis'
		fill_in 'Organisation Description (max 140 characters)', with: 'We are crisis and we help the homeless'
		fill_in 'Donation Center Address', with: 'i live here'
		fill_in 'Postcode', with: 'SW15 7HH'
		fill_in 'Weekdays', with: '9-6'
		fill_in 'Weekends', with: '11-5'
		fill_in 'Contact\'s Email Address', with: 'contact@email.com'
		fill_in 'Password', with: 'testtest'
		fill_in 'Password Confirmation', with: 'testtest'
		click_button 'Sign Up'
	end

	def multi_sign_up
		sign_up
		click_link 'Sign Out'
		click_link 'Add a Charity'
		fill_in 'Organisation Name', with: 'Second Charity'
		fill_in 'Contact\'s Email Address', with: 'second@email.com'
		fill_in 'Donation Center Address', with: 'i live here'
		page.check('Cereals')
		fill_in 'Postcode', with: 'SW19 7HH'
		fill_in 'Password', with: 'testtest'
		fill_in 'Password Confirmation', with: 'testtest'
		click_button 'Sign Up'
	end

end
