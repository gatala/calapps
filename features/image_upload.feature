Feature: Uploading Profile pictures

User Story:
	As a user
	So that I can customize my profile
	I want to be able to upload my own profile picture

Scenario: Successful upload
	Given I visit my profile page
	When I follow "Edit Profile"
	When I upload a picture
	When I press "Update"
	Then I should not see "errors"





Scenario: Unsuccessful upload
	Given I visit my profile page
	When I follow "Edit Profile"
	When I upload a non-picture
	When I press "Update"
	Then I should see an error