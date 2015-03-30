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

  it "gives an error when no details are entered" do
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', :with => 'hello@goodbye'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content "Email is invalid"
  end

  it "gives an error when no details are entered" do
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', :with => 'hello@goodbye.com'
    fill_in 'Password', :with => ''
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content "Password can't be blank"
  end
end
