Feature: View apps on CalApps
	
	As a user
	So that I can find useful apps
	I want to be able to browse the CalApps Directory

Background: applications have been added to the database
	Given the following applications exist:
    | application title | creator	 				| description			| URL							|
    | Ninja Courses		| William Li, Alex Sydell 	| Generate schedules.	| http://www.ninjacourses.com	|
    | Berkeley Time		| Yuxin Zhu, Noah Gilmore	| Look for classes.	 	| http://www.berkeleytime.com	|

Scenario: Viewing list of all applications on home page
	When I follow "UC Berkeley Application Gallery"
	Then I should see all apps