Feature: Rating and Reviewing CalApps

User Story:
	As a user
	So that I can communicate how much I like/dislike an app
	I want to be able to rate and review apps

User Story:
	As a developer
	So that I can get feedback on my applications
	I want to be able to see how others rate / review my apps

Background: applications have been added to the database
	Given the following applications exist:
    | name	| creator| description| URL	| user_email | category |
    | Ninja Courses		| William Li, Alex Sydell 	| Generate schedules.	| http://www.ninjacourses.com	| ninjacourses@something.edu | Academic |
    


Scenario: Rating an App
	When I am on the CalApps directory
	When I follow "More Details"
	When I follow "New Review"
	When I leave a rating
	When I press "Save Changes"
	When I should see my rating

Scenario: Rating an App (Sad Path)
	When I am on the CalApps directory
	When I follow "More Details"
	When I follow "New Review"
	When I leave an empty rating
	When I press "Save Changes"
	When I should see "Review rating can't be blank"

Scenario: Reviewing an App
	When I am on the CalApps directory
	When I follow "More Details"
	When I follow "New Review"
	When I fill in a test review
	When I press "Save Changes"
	Then I should see my review

Scenario: Reviewing an App (Sad Path)
	When I am on the CalApps directory
	When I follow "More Details"
	When I follow "New Review"
	When I press "Save Changes"
	Then I should see "Review rating can't be blank"


Scenario: Viewing ratings/reviews
	When I am on the CalApps directory
	When I follow "More Details"
	Then I should see "Reviews"
