require 'rails_helper'

feature 'sign up' , %Q{
  As an unauthenticated user I want to sign up so I select an item
} do

  #Acceptance Criteria
  # * Valid email address
  # * Specify and confirm password
  # * Error if above not completed
  # * If above feilds are specified, I am an authenticated user

  scenario 'specifying valid and required information (no profile picture upload)' do
    visit root_path
    click_button 'Sign Up'
    visit users_sign_up_path
    fill_in 'First Name', with: 'Kate'
    fill_in 'Last Name', with: 'Brown'
    fill_in 'Email', with: 'kb@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    visit root_path

    expect(page).to have_content("GearX")
    expect(page).to have_content('Sign Out')
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_button 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_button 'Sign Up'


    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'somethingDifferent'

    click_button 'Sign Up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content('Sign Out')
  end
end
