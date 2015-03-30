require 'rails_helper'

describe "the user login process" do
  it "logs the user in" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page). to have_content "Signed in successfully"
  end
end
