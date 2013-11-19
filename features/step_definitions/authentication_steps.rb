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
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
end

When /^the user submits valid signin information$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

Then /^she should see her profile page$/ do
  pending
  expect(page).to have_title(@user.name)
end

Then /^she should see a signout link$/ do
  pending
  expect(page).to have_link('Sign out', href: signout_path)
end

When(/^I am not signed in and I am on the Calapps page$/) do
  visit '/calapps'
end

# Then(/^I should not see "(.*?)"$/) do |arg1|
#    if page.respond_to? :should
#     page.should have_no_content(arg1)
#   else
#     assert page.has_no_content?(arg1)
#   end
# end

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
                      password: "foobar", password_confirmation: "foobar")
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
  visit '/calapps'
end

When(/^I am signed in as an admin and I am on the Calapps page$/) do
  visit signin_path
  @user = User.create(name: "Example Admin", email: "admin@admin.com",
                      password: "foobar", password_confirmation: "foobar")
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
  visit '/calapps'
end

When(/^I am not signed in and I am viewing an app$/) do
  @calapp = Calapp.create!(name:"Sample app", URL: "http://www.test.com", user_email: 'test@test.com', creator: 'Sample Joe')
  visit '/calapps/3'
end

# Then(/^I should not see "(.*?)" or "(.*?)"$/) do |arg1, arg2|
#   pending # express the regexp above with the code you wish you had
# end






When(/^I am signed in and I am viewing an app I didn't upload$/) do
  @calapp = Calapp.create!(name:"Sample app", URL: "http://www.test.com", user_email: 'test@test.com', creator: 'Sample Joe')
  visit signin_path
  @user = User.create(name: "Example User", email: "user@user.com",
                      password: "foobar", password_confirmation: "foobar")
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
  visit '/calapps/3'
end

When(/^I am signed in and I am viewing an app I uploaded$/) do
  @calapp = Calapp.create!(name:"Sample app", URL: "http://www.test.com", user_email: 'test@test.com', creator: 'Sample Joe')
  visit signin_path
  @user = User.create(name: "Example User", email: "test@test.com",
                      password: "foobar", password_confirmation: "foobar")
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
  visit '/calapps/3'
end

# Then(/^I should see "(.*?)" and "(.*?)"$/) do |arg1, arg2|
#   pending # express the regexp above with the code you wish you had
# end

When(/^I am signed in as an admin and I am viewing an app$/) do
  @calapp = Calapp.create!(name:"Sample app", URL: "http://www.test.com", user_email: 'test@test.com', creator: 'Sample Joe')
  visit signin_path
  @user = User.create(name: "Example User", email: "admin@admin.com",
                      password: "foobar", password_confirmation: "foobar")
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
  visit '/calapps/3'
end
