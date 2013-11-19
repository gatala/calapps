require 'uri'
require 'cgi'
#require 'capybara/cucumber'

Given /the following applications exist/ do |calapps_table|
  calapps_table.hashes.each do |app|
    # each returned element will be a hash whose key is the table header.
    Calapp.create!(app)
  end
  #flunk "Unimplemented"
end

When /^(?:|I )am on (.+)$/ do |page_name|
  if page_name == "the CalApps app creation page"
    pending
  	visit new_calapp_path
  elsif page_name == "the CalApps home page"
    pending
  	visit root_URL
  end
  visit path_to(page_name)
end


When /I fill in test app details/ do 
	CA = Calapp.new
	CA.name = "Test App"
	CA.URL = "http://www.test.com"
	CA.creator = "Fake Creator"
	CA.description = "Description for Test App"
	Calapp.create!(CA)
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
	CalApps.each do |app|
		step "I should see \"#{app.title}\""
	end
end

When /^(?:|I )follow "([^\"]*)"$/ do |link|
  click_link(link)
end

Then /^(?:|I )should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end

Then(/^I should not see "(.*?)"$/) do |arg1|
  if page.respond_to? :should
    assert find('body').should have_no_content(arg1)
  else
    assert find('body').has_no_content?(arg1)
  end
end