
Feature: Verify add New Program
    Background:
        Given Admin is on program module after reaching home

    Scenario: Verify add New Program
        Given Admin is on Program module
        When Admin clicks on New Program under the Program menu bar
        Then Admin should see pop up window for program details

    Scenario:Verify title of the pop up window
        Given Admin is on Program module
        When Admin clicks on New Program under the Program menu bar
        Then Admin should see window title as "Program Details"

    Scenario:Verify mandatory fields with red "*" mark
        Given Admin is on Program module
        When Admin clicks on New Program under the Program menu bar
        Then Admin should see red "*" mark beside mandatory field "Name"


    Scenario:Verify empty form submission
        Given Admin is on Program details form
        When Admin clicks save button without entering mandatory
        Then Admin gets message field is required


    Scenario:Verify cancel button
        Given Admin is on Program details form
        When Admin clicks Cancel button
        Then Admin can see Program Details form disappears


    Scenario Outline: Verify enter program name
        Given Admin is on Program details form
        When Admin enters the Name in the text box from "<KeyOption>" and "<sheetname>"
        Then Admin can see the text entered
        Examples:
            | KeyOption       | sheetname |
            | validatetextbox | Program   |


    Scenario Outline: Verify enter description
        Given Admin is on Program details form
        When Admin enters the Description in text box from "<KeyOption>" and "<sheetname>"
        Then Admin can see the text entered in description box
        Examples:
            | KeyOption       | sheetname |
            | validatetextbox | Program   |

    Scenario:Verify select Status
        Given Admin is on Program details form
        When Admin selects the status of the program by clicking on the radio button "(Active/InActive)"
        Then Admin can see 'Active/Inactive' status selected

    Scenario Outline:Verify Admin is able to save the program details
        Given Admin is on Program details form
        When Admin enter valid details for mandatory fields from "<KeyOption>" and "<sheetname>" and Click on save button
        Then Admin gets a message 'Successful Program created'
        Examples:
            | KeyOption  | sheetname |
            | validInput | Program   |

    Scenario:Verify cancel program details
        Given Admin is on Program details form
        When Admin clicks Cancel button
        Then Admin can see Program Details form disappears
        
        Scenario: Verify close window with "X" 
    Given Admin is on Program details form 
    When Admin Click on X button
    Then Admin can see Program Details form disappears
 
    Scenario Outline: Verify added Program is created
        Given Admin is on Program module
        When Admin searches with newly created Program Name sent from "<KeyOption>" and "<sheetname>"
        Then Records of the newly created  Program Name is displayed and match the data entered from "<KeyOption>" and "<sheetname>"
Examples:
            | KeyOption  | sheetname |
            | validInput | Program   |
 
    