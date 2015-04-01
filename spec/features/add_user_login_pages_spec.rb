require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_on 'Sign up'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  it "logs the user in" do
    visit root_path
    user = FactoryGirl.create(:user)
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end

  it "logs the user out" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_on "Logout"
    expect(page).to have_content "Signed out successfully"
  end

  it "returns an error if no email is entered" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on "Login"
    fill_in "Email", :with => " "
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content "Invalid email or password"
  end

  it "returns an error if no password is entered" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: ''
    click_button "Log in"
    expect(page).to have_content "Invalid email or password"
  end

  it "gives an error when password confirmation doesn't match password" do
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => ''
    click_on 'Sign up'
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  it "will return errors if user doesn't exist" do
    visit root_path
    click_on "Login"
    fill_in "Email", with: Faker::Internet.email
    fill_in "Password", with: Faker::Internet.password(8)
    click_button "Log in"
    expect(page).to have_content "Invalid email or password"
  end

  it "gives an error when the password is not long enough" do
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', :with => Faker::Internet.email
    fill_in 'Password', :with => 'pass'
    fill_in 'Password confirmation', :with => 'pass'
    click_on 'Sign up'
    expect(page).to have_content "Password is too short (minimum is 8 characters)"
  end
end
