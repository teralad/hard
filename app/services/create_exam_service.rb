class CreateExamService
    def call
        Exam.import(
            Exam.new({name: 'Exam_1'}),
            Exam.new({name: 'Exam_2'}),
            Exam.new({name: 'Exam_3'})
        )
        Exam.all
    end
  end
  