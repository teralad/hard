{
    "success": true,
    "summary": (json.partial! 'exams/exam_summary', collection: @summaries, locals: {from: @from}, as: :summary)
}