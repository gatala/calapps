Feature: View apps on CalApps

	As a user
	So that I can find useful apps
	I want to be able to browse the CalApps Directory

Background: applications have been added to the database
	Given the following applications exist:
    | name | creator 				| description										 |
    | Ninja Courses		| William Li, Alex Sydell 	| Used to generate potential schedules for students.|
    | Berkeley Time		| Yuxin Zhu, Noah Gilmore	| Used to search through different classes.			 |

Scenario: Viewing list of all applications on home page
	When I am on the CalApps application page
	Then I should see all apps