require 'rails_helper'
require_relative 'charity_helper'

include CharityHelper

feature 'charities:' do

	context 'charity not signed up/in on the homepage' do

		scenario 'should see a "Who Else is Involved" button' do
			visit '/'
			expect(page).to have_link 'Who Else is Involved'
		end

		scenario 'should be able to sign-up/in' do
			visit '/'
			expect(page).to have_link 'Sign In'
			expect(page).to have_link 'Get Involved'
			expect(page).not_to have_link 'Sign Out'
		end

		scenario 'can do that' do
			visit '/'
			sign_up
			expect(current_path).to eq '/charity'
			expect(page).to have_content 'Crisis'
		end

		scenario 'should be able to include their website url' do
			sign_up_with_website
			expect(page).to have_link 'Visit the website'
		end

		scenario 'when signing up they add donor requirements' do
			sign_up_with_reqs
			expect(page).to have_content 'Tins'
		end

		scenario 'when signing up they add opening hours' do
			sign_up_with_opening_hours
			expect(page).to have_content 'Opening hours:'
			expect(page).to have_content 'Weekday: 9-6'
			expect(page).to have_content 'Weekend: 11-5'
			expect(page).to have_content 'Weekday opening hours: 9-6'
			expect(page).to have_content 'Weekend: opening hours: 11-5'
		end

	end

	context 'charity signing up/in' do

		scenario 'should see sign out link' do
			sign_up
			visit '/charity'
			expect(page).to have_link 'Sign Out'
			expect(page).not_to have_link 'Sign In'
			expect(page).not_to have_link 'Sign Up'
		end

	end

	context 'charities created but not logged in' do

		scenario 'should see list of all the charities' do
			sign_up_with_reqs
			click_link 'Sign Out'
			visit '/charity'
			expect(page).to have_content 'All Charities'
			expect(page).to have_content 'Crisis'
			expect(page).to have_content 'We are crisis and we help the homeless'
			expect(page).to have_content 'Tins'
		end

	end

	context 'charity signed in' do

		before do
			sign_up
		end

		scenario 'should see their own profile' do
			expect(current_path).to eq '/charity'
			expect(page).to have_content 'My Profile'
			expect(page).to have_content 'Crisis'
		end

		scenario 'should be able to delete their own profile' do
			visit('/')
			click_link 'My Profile'
			expect(page).to have_content 'Crisis'
			expect(page).to have_link 'Edit profile'
			click_link 'Edit'
			expect(page).to have_content 'Edit Charity'
			expect(page).to have_button 'Remove Charity'
			click_button 'Remove Charity'
			expect(page).to have_content 'Bye! Your account has been successfully cancelled. We hope to see you again soon.'
		end

		scenario 'should be able to edit their own profile' do
			visit('/')
			click_link 'My Profile'
			click_link 'Edit'
			expect(page).to have_content 'Organisation'
			expect(page).to have_content 'Description'
			fill_in 'Organisation', with: 'ChocAid'
			fill_in 'Description', with: 'We are ChocAid and we help the homeless with chocolate'
			fill_in 'Current password', with: 'testtest'
			click_button 'Update'
			visit '/charity'
			expect(page).to have_content 'ChocAid'
			expect(page).not_to have_content 'Crisis'
		end

	end

end
