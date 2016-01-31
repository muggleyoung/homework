### Instructions:
- Install ruby (greater than 2.2.0), here is the [documentation](https://www.ruby-lang.org/en/documentation/installation/)
- Clone repo:

	```
	git clone git@github.com:muggleyoung/homework.git
	```

#### Web Test
	
- Install FireFox
- Go to `webtest/`, run:

	```
	gem install bundler
	bundle install
	```
- To run the feature

	```
	cucumber features/
	```

#### API Test

- Go to `apitest/`, run:

	```
	gem install bundler
	bundle install
	```
- To run the specs

	```
	rspec
	```


### Test Strategies and Assumptions:

#### Web Test

*Login flow for GitHub:*

- When a user login from GitHub home, and then after login, user will be on their dashboard page
- When an invalid user login, then they should see an error message on the login page 

*Assumptions:*

- Assume the user data has already been created - could be created by api, manually or inserted to database, so the test now is using the data directly from a yml file
- Assume all the details and different cases of negative scenarios are covered at lower level, so the purpose of the scenario is to check if the negative flow works

*Implementation:*

- Implemented with cucumber, capybara, selenium-webdriver
- There are three pages used in the flow, so different page models were created for each of them
- After each scenario, browser session is reset, so that the scenarios are independent between each other
- Created user model, so when there is more user data for the test, it can easily get one of the data randomly or by order
- The default driver is firefox, but the driver is configurable, other browsers can be used if needed
- For the error message, instead of verifying the exact text, I verified with the error message container, because the text could change often, and it should be tested in lower level

#### API Test

*API from GitHub - GET /user:*

- Use Get request to fetch user information, the response should be 200 with existing user
- Get an invalid user data with the request, the response should be 404

*Assumptions:*

- Assume the user data has already been inserted to the database
- Assume the test is from the consumer side, so scope is about the schema of the response json and the fields that the consumer consumes intead of the entire API response

*Implementation:*

- Implemented with rspec, faraday, because the integration test for API usually has less business behaviour involved
- The schema of the response is defined in schema.json file. If the API to test is internal, one could use Pact or other contract test tool to mock and test the interaction
- For this Get request tested, there are two cases: 200 and 404. But other endpoints could have other cases, eg. 500, 422 etc.


