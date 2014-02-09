Feature: View apps on CalApps
	
	As a user
	So that I can find useful apps
	I want to be able to browse the CalApps Directory

Background: applications have been added to the database
	Given the following applications exist:
    | name	| creator| description| URL	| user_email | category |
    | Ninja Courses		| William Li, Alex Sydell 	| Generate schedules.	| http://www.ninjacourses.com	| ninjacourses@something.edu | Academic |
    | Berkeley Time		| Yuxin Zhu, Noah Gilmore	| Look for classes.	 	| http://www.berkeleytime.com	| berkeleytime@something.edu | Academic |

Scenario: Viewing list of all applications on home page
	When I am on the CalApps directory
	Then I should see "Ninja Courses"