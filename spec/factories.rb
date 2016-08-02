FactoryGirl.define do
	# Factory girl used to create resources while testing.
	# Alternative to User.create method from Active Record

	# :user tells Factory girl to create a User resource
	factory :user do
		name "Naruto Uzumaki"
		email "naruto@rasengan.com"
		password "foobar"
		password_confirmation "foobar"
	end
end