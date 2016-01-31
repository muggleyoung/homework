Feature: login function for GitHub

    Scenario: User can log in to GitHub
        Given I visit GitHub
        When I log in with my credentials
        Then I should see my dashboard

    Scenario: User can not log in with invalid credentials
        Given I visit GitHub
        When I log in with invalid credentials
        Then I should see an error message on the page
