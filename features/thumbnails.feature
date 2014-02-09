Feature: Uploading and Viewing CalApp thumbnails

User Story:
	As a user
	So that I quickly browse apps
	I want to be see application thumbnails

User Story:
	As a developer
	So that I can make my app more visually appealing
	I want to be able to upload thumbnails

Scenario: Uploading and Viewing a Thumbnail
	When I am on the CalApps app creation page and am signed in
	When I fill in test app details 
	When I upload a thumbnail picture
	When I press "Save Changes"
	Then I should see my app
	And I should not see "error"

Scenario: Uploading and Viewing a Thumbnail (sad path)
	When I am on the CalApps app creation page and am signed in
	When I fill in test app details 
	When I upload a non-picture file for the thumbnail
	When I press "Save Changes"
	Then I should see "maybe it is not an image?"




