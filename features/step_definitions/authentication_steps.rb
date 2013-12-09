require 'uri'
require 'cgi'
#require 'capybara/cucumber'
Given /^a user visits the signin page$/ do
  visit signin_path
end

When /^she submits invalid signin information$/ do
  click_button "Sign in"
end

Then /^she should see an error message$/ do
  expect(page).to have_selector('div.alert.alert-error', text: 'Invalid')
end

Given /^the user has an account$/ do
  @user = User.create!(name: "Example User", email: "user@example.com",
                      password: "12341234", password_confirmation: "12341234")
end

When /^the user submits valid signin information$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

Then /^she should see her profile page$/ do
  visit '/users/1'
  find('body').should have_content(@user.name)
  #expect(page).to have_title(@user.name)
end

Then /^she should see a signout link$/ do
  expect(page).to have_link('Sign out', href: signout_path)
end

When(/^I am not signed in and I am on the Calapps page$/) do
  visit '/calapps'
end

Then(/^I should see a "(.*?)" button$/) do |arg1|
  page.should have_selector(:link_or_button)
end

Then(/^I should not see a "(.*?)" button$/) do |arg1|
  page.should_not have_selector(:link_or_button)
end

When(/^I am signed in as a user and I am on the Calapps page$/) do
  #pending # express the regexp above with the code you wish you had
  visit signin_path
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "12341234", password_confirmation: "12341234")
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
  visit '/calapps'
end

When(/^I am signed in as an admin and I am on the Calapps page$/) do
  visit signin_path
  @user = User.create(name: "Example Admin", email: "admin@admin.com",
                      password: "12341234", password_confirmation: "12341234")
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
  visit '/calapps'
end

When(/^I am not signed in and I am viewing an app$/) do
  @calapp = Calapp.create!(name:"Sample app", URL: "http://www.test.com", user_email: 'test@test.com', creator: 'Sample Joe', category: 'Academic')
  visit '/calapps/3'
end

When(/^I am signed in and I am viewing an app I didn't upload$/) do
  @calapp = Calapp.create!(name:"Sample app", URL: "http://www.test.com", user_email: 'test@test.com', creator: 'Sample Joe', category: 'Academic') 
  visit signin_path
  @user = User.create(name: "Example User", email: "user@user.com",
                      password: "12341234", password_confirmation: "12341234")
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
  visit '/calapps/3'
end

When(/^I am signed in and I am viewing an app I uploaded$/) do
  @calapp = Calapp.create!(name:"Sample app", URL: "http://www.test.com", user_email: 'test@test.com', creator: 'Sample Joe', category: 'Academic')
  visit signin_path
  @user = User.create(name: "Example User", email: "test@test.com",
                      password: "12341234", password_confirmation: "12341234")
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
  visit '/calapps/3'
end

When(/^I am signed in as an admin and I am viewing an app$/) do
  @calapp = Calapp.create!(name:"Sample app", URL: "http://www.test.com", user_email: 'test@test.com', creator: 'Sample Joe', category: 'Academic')
  visit signin_path
  @user = User.create(name: "Example User", email: "admin@admin.com",
                      password: "12341234", password_confirmation: "12341234")
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
  visit '/calapps/3'
end


When(/^I am on the CalApps app creation page and am signed in$/) do
  visit signin_path
  @user = User.create(name: "Example User", email: "user@user.com",
                      password: "12341234", password_confirmation: "12341234")
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
  visit '/calapps/new'
end

Given(/^I visit my profile page$/) do
  visit signin_path
  @user = User.create!(name: "Example User", email: "user@user.com",
                      password: "12341234", password_confirmation: "12341234")
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
  visit '/users/1'
end

When(/^I upload a picture$/) do
  attach_file('user_image', File.join(Rails.root, 'public', 'assets', 'sample-profile-pic.jpg'))
end

When(/^I upload a non\-picture$/) do
  attach_file('user_image', File.join(Rails.root, 'public', '404.html'))
end

Then(/^I should see an error$/) do
  expect(page).to have_selector('div.alert.alert-error')
end

When(/^I fill in a test review$/) do
  select("4", :from => "review[review_rating]") 
  fill_in "Comment Here", with: "Test Comment"
end

Then(/^I should see my review$/) do
  review = 'Test Comment'
  if page.respond_to? :should
    find('body').should have_content(review)
  else
    find('body').has_content?(review)
  end
  rating = "4"
  if page.respond_to? :should
    find('body').should have_content(rating)
  else
    find('body').has_content?(rating)
  end
end

When(/^I upload a thumbnail picture$/) do
  attach_file('calapp_screenshot1', File.join(Rails.root, 'public', 'assets', 'sample-profile-pic.jpg'))
end

When(/^I upload a non\-picture file for the thumbnail$/) do
  attach_file('calapp_screenshot1', File.join(Rails.root, 'public', '404.html'))
end

When(/^I leave a rating$/) do
  select("4", :from => "review[review_rating]") 
end

When(/^I should see my rating$/) do
  rating = "4"
  if page.respond_to? :should
    find('body').should have_content(rating)
  else
    find('body').has_content?(rating)
  end
end

When(/^I leave an empty rating$/) do
  #do nothing
end


When(/^I search for "(.*?)"$/) do |arg1|
  pending
  fill_in("large-8 small-9 columns", :with => arg1)
end