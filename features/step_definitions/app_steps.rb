require 'uri'
require 'cgi'

When /^(?:|I )am on (.+)$/ do |page_name|
  if page_name == "the CalApps app creation page"
  	visit path_to(calapp_path)
  elsif page_name == "the CalApps home page"
  	visit path_to(calapp_path)
  end

  visit path_to(page_name)
end

When /When I am on the CalApps app creation page/ do
	visit path_to(calapp_path)
end


When /I fill in test app details/ do 
	CA = Calapp.new
	CA.name = "Test App"
	CA.url = "http://www.test.com"
	CA.creator = "Fake Creator"
	CA.description = "Description for Test App"
	CalApp.create!(CA)
end

When /I press "(.*)"/ do |button|
	click_button(button)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
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

