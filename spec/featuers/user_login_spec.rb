require 'rails_helper'

RSpec.feature "User login", :type => :feature do
  scenario "When User Log In" do
    visit "/users/sign_in"
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Welcome On Rental Propert Page Please LogIn'
  end
  
  scenario "When User create a new account" do
    visit "/users/sign_up"
    fill_in 'First name', with: 'First name'
    fill_in 'Last name', with: 'Last name'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Phone', with: 'Phone'
    fill_in 'Password', with: 'Password'
    fill_in 'Password confirmation', with: 'Password confirmation'
    click_button 'Sign up'
    expect(page).to have_content "Welcome On Rental Propert Page Please LogIn"
  end 

 

  scenario "When User confirm Email" do
    visit "/users/confirmation/new"
    fill_in 'Email', with: 'user@example.com'
  end 

  scenario "When User forgot password" do
    visit "/users/password/new"
    fill_in 'Email', with: 'user@example.com'
  end

  scenario "When User Logout" do
    visit "/users/sign_in"
  end 

  scenario "When user click home button" do
    visit "/admins/index"
  end

  scenario "When user click contact button" do
    visit "/contact"
  end

  scenario "When user click about us button" do
    visit "/about"
  end
  
end

