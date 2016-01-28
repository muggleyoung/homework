Feature: Search function for GitHub

    Scenario: User can search by repository name
        Given I visit GitHub
        When I search for repository "muggleyoung.github.io"
        Then I should see this repository in the search results
