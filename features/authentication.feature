Feature: Logging in and only being able to access certain things based on login status

User Story:
	As a user
	So that I can manage my apps
	I want to be able to signin and create/edit/delete my own apps and no non-admin user should be able to do this

User Story:
	As an admin
	So that I can moderate apps
	I want to be able to signin and create/edit/delete any app

Background: applications have been added to the database
	Given the following applications exist:
    | name				| creator	 				| description			| URL							| user_email 				 |
    | Ninja Courses		| William Li, Alex Sydell 	| Generate schedules.	| http://www.ninjacourses.com	| ninjacourses@something.edu |
    | Berkeley Time		| Yuxin Zhu, Noah Gilmore	| Look for classes.	 	| http://www.berkeleytime.com	| berkeleytime@something.edu |



Scenario: Viewing List of Calapps as a visitor(non-signed-in user)
	When I am not signed in and I am on the Calapps page
	Then I should not see "new" 

Scenario: Visiting List of Calapps as a signed in user
	When I am signed in as a user and I am on the Calapps page
	Then I should see a "new" button

Scenario: Visiting List of Calapps as an admin
	When I am signed in as an admin and I am on the Calapps page
	Then I should see a "new" button

Scenario: Looking at a Calapp as a visitor (non-signed in user)
	When I am not signed in and I am viewing an app
	Then I should not see "Edit" or "Delete" 

Scenario: Looking at a Calapp as a non-creator user
	When I am signed in and I am viewing an app I didn't upload
	Then I should not see "Edit" or "Delete" 

Scenario: Looking at a Calapp as a creator
	When I am signed in and I am viewing an app I uploaded
	Then I should see a "Edit" button
	And I should see a "Delete" button

Scenario: Looking at a Calapp as an admin
	When I am signed in as an admin and I am viewing an app
	Then I should see a "Edit" button
	And I should see a "Delete" button





