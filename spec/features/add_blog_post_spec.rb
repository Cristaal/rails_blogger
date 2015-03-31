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

  it "updates a blog post" do
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
    click_on "Blog Posts"
    click_on "Edit Post"
    fill_in "Title", with: Faker::Lorem.sentence(rand(2..10)).chomp('.')
    fill_in "Body", with: Faker::Lorem.words(rand(2..10)).join(' ')
    click_on "Update Post"
    expect(page).to have_content "Post Successfully Updated"
  end

  it "deletes a blog post", js: true do
    visit root_path
    user = FactoryGirl.create(:user)
    click_on "Login"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"
    click_on "New Entry"
    fill_in "Title", with: Faker::Lorem.sentence(rand(2..10)).chomp('.')
    fill_in "Body", with: Faker::Lorem.words(rand(2..10)).join(' ')
    click_on "Blog Posts"
    click_on "Edit Post"
    click_on "Your Blog Posts"
    click_on "Delete Post"
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content "Post Successfully Deleted!"
  end
end
