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


### Test Plan and Assumptions:

#### Web Test

*Test the login flow for GitHub:*

- When a user login from GitHub home page, and verification is to verify after login, user is on their dashboard page.
- When a invalid user login GitHub, verify they should see an error message on the login page 

*Assumptions:*

- Assume the user data has already been created - could be created by api, manually or inserted to database, so the test now use the data directly from a yml file
- Assume all the details and different cases of negative scenarios are covered at lower level, so the propose of the scenario is to check if the negative flow works

*Implementation:*

- Implemented with cucumber, capybara, selenium-webdriver
- Three page has been used, so created different page model for them
- Cleared browser session after each scenario run, so that the scenarios are independent between each other
- Created user model, so when there is more user data for test, the test will be able to easily get one of them randomly or by order
- The default driver now is firefox, but it is extendable, can add other browser support if needed
- For the error message, instead of verifying the copy, I verified with the error message container, because the copy could change often, and the copy of the message could covered in lower level test
- Currently, the app and test are running faster. In the future, we can add more waiting for the find/verify elements, so the test will running more stable on a slow app

#### API Test

*Test one API from GitHub:*

- Use Get request to get user information, and the response should be 200 with existing user
- Get an invalid user data with the request, the response should be 404

*Assumptions:*

- Assume the user data has already been inserted to the database
- Assume the test is from the consumer side, so scope is about the schema of the response json and the fields that the consumer consumes

*Implementation:*

- Implemented with rspec, faraday, because the integration test for API usually has less business behaviour involved
- The schema of the response is defined in schema.json file. If it is for API from non-public provider, could use pact or other contract test tool to build up the mock server response
- For this Get request tested, there are two cases: 200 and 404. But could have more different cases tested for other APIs, eg. 500, 400 etc.


