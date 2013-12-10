require 'uri'
require 'cgi'
#require 'capybara/cucumber'

Given /the following applications exist/ do |calapps_table|
  calapps_table.hashes.each do |app|
    # each returned element will be a hash whose key is the table header.
    Calapp.create!(app)
  end
end

When(/^I am on the CalApps directory$/) do
  visit '/calapps'
end

Then(/^I should see my app$/) do
  find('body').should have_content('Test App')
end



When /I fill in test app details/ do 
	@CA = Calapp.new(:name => 'Test App', :URL => 'http://www.test.com', :creator => 'Fake Creator', 
    :user_email => 'creator@creator.com', :description => 'Description for Test App', :category => "Academic")
  fill_in "calapp_name",    with: @CA.name
  fill_in "calapp_URL", with: @CA.URL
  fill_in "calapp_creator",    with: @CA.creator
  #fill_in "user_email", with: @CA.user_email
  fill_in "calapp_description", with: @CA.description
  #fill_in "calapp_category", with: @CA.category
  select("Academic", :from => "calapp_category")
end

When /I press "(.*)"/ do |button|
	click_button(button)
end

Then /^(?:|I )should see "([^\"]*)"$/ do |text|
  if page.respond_to? :should
    find('body').should have_content(text)
  else
    find('body').has_content?(text)
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