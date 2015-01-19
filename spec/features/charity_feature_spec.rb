require 'rails_helper'
require_relative 'charity_helper'

include CharityHelper

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
			sign_up
		end

		scenario 'should see sign out link' do
			visit '/charity'
			expect(page).to have_link 'Sign Out'
			expect(page).not_to have_link 'Sign In'
			expect(page).not_to have_link 'Sign Up' 
		end

	end

	context 'charity is signed in' do

		scenario 'should see their stuff' do
			sign_up
		end

	end

end