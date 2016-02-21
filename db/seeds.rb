# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
subjects = ["Accounting","Art","Biology","Buisiness","Chemistry","Communication","Computer Science","Econnomics","English","Graphic Design", "Health", "Journalism","Languages","Mathematics","Media Studies","Music","Nursing","Philosophy", "Photography","Physics","Political Science","Psychology","Religious Studies","Sociology","Other Sciences", "Other Arts", "Other"]
num = 1
subjects.each do |subject|
	 u = User.create(username:"user#{num}",password:"user#{num}", email:"user#{num}@gmail.com")
	Post.create(title:"post#{num}",body:"#{subject}#{num}",user_id:u.id, subject:subject)
	num = num + 1
end