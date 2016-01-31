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

- Tested the Get request to get user information, and the response should be 200OK with required user data
- 

*Assumptions:*

- Assume the user data has already been created - could be created by api, manually or inserted to database, so the test now use the data directly from a yml file

*Implementation:*

- Implemented with cucumber, capybara, selenium-webdriver
- Three page has been used, so created different page model for them
- Cleared browser session after each scenario run, so that the scenarios are independent between each other
- Created user model, so when there is more user data for test, the test will be able to easily get one of them randomly or by order
- The default driver now is firefox, but it is extendable, can add other browser support if needed


