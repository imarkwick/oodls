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

end