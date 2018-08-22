# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

exam = Exam.import(
            {name: 'Exam 1'}, 
            {name: 'Exam 2'},
            {name: 'Exam 3'},
            {name: 'Exam 4'},
            {name: 'Exam 5'}
        )
subject = Subject.create()