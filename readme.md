#### Instructions:
- Install ruby (better to be 2.2.0), this is the [document](https://www.ruby-lang.org/en/documentation/installation/)
- Clone repo:

	```
	git clone git@github.com:muggleyoung/homework.git
	```

###### Web Test
	
- Install FireFox
- Go to /webtest/, run:

	```
	gem install bundler
	bundle install
	```
- Then run from commandline

	```
	cucumber features/
	```
###### API Test

- Go to /apitest/, run:

	```
	gem install bundler
	bundle install
	```
- Then run from command line

	```
	rspec
	```
