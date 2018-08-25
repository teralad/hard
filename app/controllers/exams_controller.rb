class ExamsController < ApplicationController
  include Questionable
  before_action :authenticate_user!

  def index
    @exams = Exam.all
  end

  def show
    @exam = Exam.find(params[:id])
  end

  def exam_summary
    begin
      @from = params[:from].to_s.capitalize+" ID"
      @summaries = exam_summary_builder(params[:from])
    rescue
      @summaries = []
    end
    respond_to do |format|
      format.html {}
      format.json {}
    end
  end
  
end
  