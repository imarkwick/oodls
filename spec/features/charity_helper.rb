module CharityHelper

	def sign_up
		visit '/charity'
		click_link 'Sign Up'
		fill_in 'Organisation', with: 'Crisis'
		fill_in 'Description', with: 'We are crisis and we help the homeless'
		fill_in 'Contact name', with: 'contact'
		fill_in 'Email', with: 'contact@email.com'
		fill_in 'Full address', with: 'i live here'
		fill_in 'Postcode', with: 'SW15 7HH'
		fill_in 'Password', with: 'testtest'
		fill_in 'Password confirmation', with: 'testtest'
		click_button 'Sign Up'
	end

end