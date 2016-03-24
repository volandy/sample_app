# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Andrii Volkov",
			 email: "volandy14@gmail.com",
			 password: "123654",
			 password_confirmation: "123654",
			 admin: true,
			 activated: true,
			 activated_at: Time.zone.now)

User.create!(name: "Nazar Tkach",
			 email: "ntkach@plslogistics.com",
			 password: "0977072683",
			 password_confirmation: "0977072683",
			 admin: false,
			 activated: true,
			 activated_at: Time.zone.now)

User.create!(name: "Valentyn Rubliuk",
			 email: "vrubliuk@plslogistics.com",
			 password: "0637574922",
			 password_confirmation: "0637574922",
			 admin: false,
			 activated: true,
			 activated_at: Time.zone.now)

User.create!(name: "Anna Sverdlovska",
			 email: "asverdlovska@plslogistics.com",
			 password: "0938528883",
			 password_confirmation: "0938528883",
			 admin: false,
			 activated: true,
			 activated_at: Time.zone.now)

User.create!(name: "Unnamed Unnamed",
			 email: "eyebp9@gmail.com",
			 password: "0639239312",
			 password_confirmation: "0639239312",
			 admin: false,
			 activated: true,
			 activated_at: Time.zone.now)

99.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@railstutorial.org"
	password = "password"
	User.create!(name: name,
				  email: email,
				  password: password,
				  password_confirmation: password,
				  activated: true,
				  activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

#Following  relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }