class ExamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @exams = Exam.all
  end

  def show
    @exam = Exam.find(params[:id])
  end

  def exam_summary
    begin
      group_condition = if params[:from].present?
        @from = params[:from].capitalize+" ID"
        construct_params params[:from]
      else
        'chapters.id, topics.id, subjects.id, exams.id'
      end
      summaries = Question.joins('left join answers on answers.question_id = questions.id').
                    joins({:chapter=>{:topic=>{:subject=>:exam}}}).
                    group(group_condition).
                    select("sum(if(answers.option_id is not null and answers.option_id = questions.correct_option_id,1,0)) correct_answers_count, 
                            sum(if(answers.id is null,1,0)) unanswerd_count, 
                            sum(if(answers.id is not null and answers.option_id is null,1,0)) skipped_answers_count, 
                            sum(if(answers.option_id is not null and answers.option_id != questions.correct_option_id,1,0)) wrong_answers_count, 
                            count(questions.id) total_questions").
                    select(group_condition).as_json
      @summaries = summaries.map { |ques_summary|
        ques_summary['correct_percent'] = ((ques_summary['correct_answers_count'].to_f/ques_summary['total_questions'].to_f)*100).round(2)
        ques_summary['incorrect_percent'] = ((ques_summary['wrong_answers_count'].to_f/ques_summary['total_questions'].to_f)*100).round(2)
        ques_summary['skipped_percent'] = ((ques_summary['skipped_answers_count'].to_f/ques_summary['total_questions'].to_f)*100).round(2)
        ques_summary['unanswered_percent'] = ((ques_summary['unanswerd_count'].to_f/ques_summary['total_questions'].to_f)*100).round(2)
        ques_summary
      }
    rescue
      @summaries = []
    end
    respond_to do |format|
      format.html {}
      format.json {}
    end
  end

  private
  
  def construct_params(from)
    case from 
    when 'chapter'
      'chapters.id'
    when 'exam'
      'exams.id'
    when 'topic'
      'topics.id'
    when 'subject'
      'subjects.id'
    end
  end
end
  