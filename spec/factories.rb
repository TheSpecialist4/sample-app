FactoryGirl.define do
	# Factory girl used to create resources while testing.
	# Alternative to User.create method from Active Record

	# :user tells Factory girl to create a User resource
	factory :user do
		sequence(:name) { |n| "User #{n}" }
		sequence(:email) { |n| "user#{n}@email.com" }
		password "foobar"
		password_confirmation "foobar"
	end

	factory :micropost do
		content "sfkjh adkjh"
		user
	end
end