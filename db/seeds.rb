# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
user = User.create(nickname: "foo", name: "bar", password: "111111")
admin = Admin.create(name: "foobar", password: "111111")
Project.delete_all
project = Project.create(name: "example")
100.times {Record.create(user_id: user.id, date: Date.today, project_id: project.id, hour: 8, remark: "remark")}