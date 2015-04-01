require 'rails_helper'

describe "the add a comment to blog post process" do
  it "adds a comment to an existing blog post" do 
    visit root_path
    user = FactoryGirl.create(:user)
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_on "New Entry"
    title = Faker::Lorem.sentence(rand(2..10)).chomp('.')
    fill_in "Title", with: title
    fill_in "Body", with: Faker::Lorem.words(rand(2..10)).join(' ')
    click_on "Create Post"
    click_link "#{title}"
    click_on "Add a Comment"
    fill_in "Body", with: Faker::Lorem.words(rand(2..10)).join(' ')
    click_button "Create Comment"
    expect(page).to have_content "Your Comment Has Been Added!"
  end
end