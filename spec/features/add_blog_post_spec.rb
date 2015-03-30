require 'rails_helper'

describe "the add a blog post process" do
  it "adds a new blog post" do
    visit root_path
    user = FactoryGirl.create(:user)
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_on "New Entry"
    fill_in "Title", with: Faker::Lorem.sentence(rand(2..10)).chomp('.')
    fill_in "Body", with: Faker::Lorem.words(rand(2..10)).join(' ')
    click_on "Create Post"
    expect(page).to have_content "Post Successfully Added!"
  end
end
