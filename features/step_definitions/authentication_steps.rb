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
  expect(page).to have_title(@user.name)
end

Then /^she should see a signout link$/ do
  expect(page).to have_link('Sign out', href: signout_path)
end

When(/^I am not signed in and I am on the Calapps page$/) do
  #pending # express the regexp above with the code you wish you had
  visit '/calapps'
end

# Then(/^I should not see "(.*?)"$/) do |arg1|
#   pending # express the regexp above with the code you wish you had
# end

# When(/^I am signed in as a user and I am on the Calapps page$/) do
#   pending # express the regexp above with the code you wish you had
# end

# When(/^I am signed in as an admin and I am on the Calapps page$/) do
#   pending # express the regexp above with the code you wish you had
# end

# When(/^I am not signed in and I am viewing an app$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Then(/^I should not see "(.*?)" or "(.*?)"$/) do |arg1, arg2|
#   pending # express the regexp above with the code you wish you had
# end

# When(/^I am signed in and I am viewing an app I didn't upload$/) do
#   pending # express the regexp above with the code you wish you had
# end

# When(/^I am signed in and I am viewing an app I uploaded$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Then(/^I should see "(.*?)" and "(.*?)"$/) do |arg1, arg2|
#   pending # express the regexp above with the code you wish you had
# end

# When(/^I am signed in as an admin and I am viewing an app$/) do
#   pending # express the regexp above with the code you wish you had
# end
