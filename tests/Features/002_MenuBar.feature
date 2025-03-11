
Feature: Menu Bar
Background: 
Given Admin is logged in to LMS Portal
 
Scenario:Verify Logout displayed in menu bar
Given Admin is on home page after Login
When Admin clicks Program on the navigation bar
Then Admin should see Logout in menu bar

Scenario:Verify heading in menu bar
Given Admin is on home page after Login
When Admin clicks Program on the navigation bar
Then Admin should see the heading " LMS - Learning Management System "

Scenario:Verify other module's name displayed in menu bar
Given Admin is on home page after Login
When Admin clicks Program on the navigation bar
Then Admin should see the module names as in order "Home Program Batch Class Admin Assignment Attendance"
 
Scenario:Verify sub menu displayed in program menu bar
Given Admin is on program page
When Admin clicks Program on navigation bar
Then Admin should see sub menu in menu bar as "Add New Program"