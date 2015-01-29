require 'rails_helper'
require_relative 'charity_helper'

include CharityHelper

feature 'Donors:' do

	context 'looking to make a donation' do

		scenario 'should be able to view all the charities signed up' do
			multi_sign_up
			visit '/'
			click_link 'Where to give?'
			expect(page).to have_content 'All Charities'
			expect(page).to have_content 'Crisis'
			expect(page).to have_content 'Second Charity'
		end

		scenario 'should be able to visit the website' do
			sign_up_with_website
			click_link 'Where to give?'
			expect(page).to have_link 'Visit the website'
			click_link 'Visit the website'
			expect(current_url).to eq 'http://www.crisis.org.uk/'
		end

		scenario 'should be able to find out donation guidelines', :js => true do
			visit '/'
			expect(page).to have_link 'Donation Guidelines'
		  click_link('Donation Guidelines')
	 		expect(page).to have_content 'Content coming soon...'
		end

		scenario 'should be able to see if there is more they can do', :js => true do
			visit '/'
			expect(page).to have_link 'What more can I do?'
		  click_link('What more can I do?')
	 		expect(page).to have_content 'Content coming soon...'
		end

	end

	context 'filtering search results' do

		before do
			multi_sign_up
			visit '/charities'
		end

		scenario 'sould be able to search by case insensitive organisation' do
			expect(page).to have_css '#search-form'
			expect(page).to have_button 'Search'
			fill_in :search, with: 'crisis'
			click_button 'Search'
			expect(page).to have_content 'Crisis'
			expect(page).not_to have_content 'Second Charity'
		end

		# scenario 'should be able to filter by food type' do
		# 	expect(page).to have_css '.small-icon'
		# 	expect(page).to have_link	'Cereals'
		# 	click_link 'Cereals'
		# 	expect(page).to have_content 'Second Charity'
		# end

	end

end