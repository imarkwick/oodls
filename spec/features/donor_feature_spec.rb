require 'rails_helper'

context "donors are not signed in when arriving on homepage" do

  it "should see 'sign in' and 'sign up' links" do
    visit('/')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end

  it "should not see 'sign out' link" do
    visit('/')
    expect(page).not_to have_link('Sign out')
  end

end

context "user signed in" do

  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'lovelyperson@toomuchfood.com')
    fill_in('Password', with: 'IWantToDonate')
    fill_in('Password confirmation', with: 'IWantToDonate')
    click_button('Sign up')
  end

  it "should see a 'sign out' link" do
    visit('/')
    expect(page).to have_link('Sign out')
  end

end
