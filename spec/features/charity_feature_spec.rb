require 'rails_helper'

feature 'charity wants to sign-up/in' do

	context 'charity not signed up/in on the homepage' do

		scenario 'should see a charity button' do
			visit '/'
			expect(page).to have_link 'Charity'
		end

		scenario 'should be able to sign-up/in' do
			visit '/'
			click_link 'Charity'
			expect(page).to have_link 'Sign In'
			expect(page).to have_link 'Sign Up'
			expect(page).not_to have_link 'Sign Out'
		end

	end

	context 'charity signs in' do 

		before do
			visit '/charity'
			click_link 'Sign Up'
			fill_in 'Organisation', with: 'Crisis'
			fill_in 'Contact name', with: 'contact'
			fill_in 'Email', with: 'contact@email.com'
			fill_in 'Postcode', with: 'SW15 7HH'
			fill_in 'Password', with: 'testtest'
			fill_in 'Password confirmation', with: 'testtest'
			click_button 'Sign Up'
		end

		scenario 'should see sign out link' do
			visit '/charity'
			expect(page).to have_link 'Sign Out'
			expect(page).not_to have_link 'Sign In'
			expect(page).not_to have_link 'Sign Up' 
		end

	end

end