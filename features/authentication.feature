Feature: Logging in and only being able to access certain things based on login status

User Story:
	As a user
	So that I can manage my apps
	I want to be able to signin and create/edit/delete my own apps and no non-admin user should be able to do this

User Story:
	As an admin
	So that I can moderate apps
	I want to be able to signin and create/edit/delete any app

Scenario: Viewing List of Calapps as a visitor(non-signed-in user)
	When I am not signed in and I am on the Calapps page
	Then I should not see "New"

Scenario: Visiting List of Calapps as a signed in user
	When I am signed in as a user and I am on the Calapps page
	Then I should see "New"

Scenario: Visiting List of Calapps as an admin
	When I am signed in as an admin and I am on the Calapps page
	Then I should see "New"

Scenario: Looking at a Calapp as a visitor (non-signed in user)
	When I am not signed in and I am viewing an app
	Then I should not see "Edit" or "Delete"

Scenario: Looking at a Calapp as a non-creator user
	When I am signed in and I am viewing an app I didn't upload
	Then I should not see "Edit" or "Delete"

Scenario: Looking at a Calapp as a creator
	When I am signed in and I am viewing an app I uploaded
	Then I should see "Edit" and "Delete"

Scenario: Looking at a Calapp as an admin
	When I am signed in as an admin and I am viewing an app
	Then I should see "Edit" and "Delete"





