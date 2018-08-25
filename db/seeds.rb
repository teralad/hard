# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

token = JwtService.new(user: user).build!

exams = CreateExamService.new.call

subject_names = [
    ['Ruby','node','scheme'],
    ['rust','Python','haskell'],
    ['Go','Lisp','Brain_fuck']
]

topics = ['functions', 'objects']

functional_chapter_names = ['library functions', 'user defined functions']
object_chapter_names = ['class_objects', 'basic object']

question_creator = CreateQuestionService.new

puts 'CREATING EXAMS'
exams.each_with_index do |exam, i|
    exam.subjects.create([{name: subject_names[i][0]}, {name: subject_names[i][1]}, {name: subject_names[i][2]}])
    puts 'CREATING SUBJECTS FOR EXAMS'
    Subject.all.each_with_index do |subject, i|
        subject.topics.create([{name: topics[0]},{name: topics[1]}])
        puts 'CREATING TOPICS FOR SUBJECTS'
        subject.topics.each_slice(2) do |topic1, topic2|
            topic1.chapters.create([{name: functional_chapter_names[0]}, {name: functional_chapter_names[1]}])
            topic2.chapters.create([{name: object_chapter_names[0]}, {name: object_chapter_names[1]}])
            puts "CREATING QUESTIONS FOR TOPICS\n"
            topic1.chapters.zip(topic2.chapters).flatten.each do |chapter|
                question_creator.call(chapter: chapter, question_count: 30)
            end
        end
    end
end

puts "SEEDING DONE. USE TOKEN TO ACCESS API's \n #{token.jti}"
puts 'CREATING FEW ANSWERS FOR SEEDED USER'

Question.first(5).each do |ques|
    ques.answers.create(user: user,option_id: ques.correct_option_id)
end
Question.limit(5).offset(5).each do |ques|
    ques.answers.create(user: user,option_id: rand(1..50))
end
Question.limit(5).offset(10).each do |ques|
    ques.answers.create(user: user)
end