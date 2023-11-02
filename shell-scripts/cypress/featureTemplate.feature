Feature: Check The Accessibility SETPAGE Page
Scenario: Access to SETPAGE page
    Given the user is logged
    When the user clicks on the redirect button SETPAGE
    Then the user should be redirected to SETPAGE page