@login
Feature:Login Page Verification

Background: 
Given Admin launch the browser

Scenario Outline: Validate login with valid credentials
Given Admin is in login Page
When Admin enter valid username and password from excel file for the scenario "<KeyOption>" and clicks login button 
Then Admin should land on dashboard page.  

Examples:
|   KeyOption        |
|   ValidCredential  |