Feature: Add an app to the list of CalApps
	As a developer/admin
	So that I can publicize my app
	I want to be able to add an app to the CalApps Directory

Scenario: Adding an app
	When I am on the CalApps app creation page
	When I fill in test app details
	When I press "Submit App"
	Then I should see all apps