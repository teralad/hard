# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

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

exams.each_with_index do |exam, i|
    exam.subjects.create([{name: subject_names[i][0]}, {name: subject_names[i][1]}, {name: subject_names[i][2]}])
    Subject.all.each_with_index do |subject, i|
        subject.topics.create([{name: topics[0]},{name: topics[1]}])
        subject.topics.each_slice(2) do |topic1, topic2|
            topic1.chapters.create([{name: functional_chapter_names[0]}, {name: functional_chapter_names[1]}])
            topic2.chapters.create([{name: object_chapter_names[0]}, {name: object_chapter_names[1]}])
            topic1.chapters.zip(topic2.chapters).flatten.each do |chapter|
                question_creator.call(chapter: chapter, question_count: 30)
            end
        end
    end
end
            