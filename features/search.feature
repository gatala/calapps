Feature: Searching the database of CalApps

User Story:
	As a user
	So that I can find specific apps
	I want to be able to search for apps

Background: applications have been added to the database
	Given the following applications exist:
    | name	| creator| description| URL	| user_email | category |
    | Ninja Courses		| William Li, Alex Sydell 	| Generate schedules.	| http://www.ninjacourses.com	| ninjacourses@something.edu | Academic |
    | Berkeley Time		| Yuxin Zhu, Noah Gilmore	| Look for classes.	 	| http://www.berkeleytime.com	| berkeleytime@something.edu | Academic |	


Scenario: Searching for a specific app
	When I am on the CalApps directory
	When I search for "Ninja Courses"
	Then I should see "Ninja Courses"
	And I should not see "Berkeley Time"

Scenario: Searching for a non-existent app (sad path)
	When I am on the CalApps directory
	When I search for "Non-existent App"
	Then I should see an error