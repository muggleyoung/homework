Feature: login function for GitHub

    Scenario: User can log in to GitHub
        Given I visit GitHub
        When I log in with my credentials
        Then I should see welcome message on the page
