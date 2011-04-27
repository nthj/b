Setup:

	git clone git://github.com/nthj/b.git
	
	cd b
	
	heroku create --stack bamboo-mri-1.9.2 --addons custom_domains:basic
	
	heroku domains:add b.example.com
	
	heroku config:add B_ROOT=b.example.com DESTINATION_ROOT=example.com
	
	git push heroku

	heroku rake setup

Add a destination:

	rake add DESTINATION=/2011/04/example-title
	
Add a destination and specify the key:

	rake add DESTINATION=/2011/04/example-title KEY=ea
	
Force overwrite of key:

	rake add DESTINATION=/2011/04/example-title KEY=ea FORCE=true
