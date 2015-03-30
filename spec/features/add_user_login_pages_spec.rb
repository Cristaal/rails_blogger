require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', :with => 'No@reservations.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  it "gives an error when email is incomplete" do
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', :with => 'hello@goodbye'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content "Email is invalid"
  end

  it "gives an error when no password is entered" do
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', :with => 'hello@goodbye.com'
    fill_in 'Password', :with => ''
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content "Password can't be blank"
  end

  it "gives an error when password confirmation doesn't match password" do
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', :with => 'hello@goodbye.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => ''
    click_on 'Sign up'
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  it "gives an error when the password is not long enough" do
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', :with => 'hello@goodbye.com'
    fill_in 'Password', :with => 'pass'
    fill_in 'Password confirmation', :with => 'pass'
    click_on 'Sign up'
    expect(page).to have_content "Password is too short (minimum is 8 characters)"
  end
end
