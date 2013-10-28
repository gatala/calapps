require 'uri'
require 'cgi'

Given /the following applications exist/ do |calapps_table|
  calapps_table.hashes.each do |app|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Calapp.create!(app)
  end
  #flunk "Unimplemented"
end

# When /^(?:|I )am on (.+)$/ do |page_name|
#   #if page_name == "the CalApps app creation page"
#   visit '/calapps/new'
#   #elsif page_name == "the CalApps home page"
#   #	visit '/calapps'
#   #elsif page_name == "the CalApps application page"
#   #  visit '/calapps'
#   #end
#   #visit path_to(page_name)
# end

When /^I am on (.+)$/ do |page|
  if page == "the CalApps app creation page"
    visit '/calapps/new'
  elsif page == 'the CalApps application page'
    visit '/calapps'
  end
end


# When(/^I am on the CalApps app creation page$/) do
#   visit '/calapps/new'
# end

# When(/^I am on the CalApps application page$/) do
#   visit '/calapps'
# end


When /I fill in test app details/ do 
	CA = Calapp.new
	CA.name = "Test App"
	CA.URL = "http://www.test.com"
	CA.creator = "Fake Creator"
	CA.description = "Description for Test App"
	CA.save!
end

When /I press "(.*)"/ do |button|
	click_button(button)
end

Then /^(?:|I )should see "([^\"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /I should see all apps/ do
	Calapps.each do |app|
		step "I should see \"#{app.title}\""
	end
end

When /^(?:|I )follow "([^\"]*)"$/ do |link|
  click_link(link)
end

Then /^I should be on (.+)$/ do |page|
  if page == "the CalApps application page"
    visit '/calapps'
  end
end

Then /^(?:|I )should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end

