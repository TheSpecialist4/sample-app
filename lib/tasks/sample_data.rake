namespace :db do
	desc "Add tweets to users"
	task populate: :environment do
		users = User.all.limit(6)
		50.times do
			content = Faker::Lorem.sentence(5)
			users.each { |user| user.microposts.create!(content: content) }
		end
	end
end