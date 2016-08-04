namespace :db do
	desc "Fill database with sample users"
	# task db:populate definition
	# :env.. ensures rake has access to local rails env
	task populate: :environment do
		User.create!(
			name: "Example User",
			email: "example@email.com",
			password: "foobar",
			password_confirmation: "foobar"
		)
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@email.com"
			password = "foobar"
			User.create!(
				name: name,
				email: email,
				password: password,
				password_confirmation: password
			)
		end
	end
end