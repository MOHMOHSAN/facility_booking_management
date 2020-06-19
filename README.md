# README

This README would normally document whatever steps are necessary to get the
application up and running.

Steps To Set Up Localhost

* Configuration
	- Bundle install

* Database creation
	- rails db:create

* Database initialization
	- rake db:migrate db:test:prepare
	- rake db:seed

* How to run the test suite
	- rspec ./spec/models/room_spec.rb
	- rspec ./spec/models/booking_spec.rb

* Start Server
	- rails s



Business Logic
- Users can't book meeting room for past date/time
- Users must login to book the room
- Users can only book the room at one time ; meaning 2 users can't book the same room
- Users can only book the room during the business operating hours
- Users can only view active booking ; meaning their past booking won't be displayed
- Users can only cancel the meeting before the date expired



Features that can be improved 
- Disable the user to book on weekends
- Admin User to manage booking approval
- Dis-allow user to book multiple rooms at the same time; meaning same time for different rooms are not allowed
- Point system to manage over-booking
- Penalty charges(point deduction) for user if they cancel at the last minutes



