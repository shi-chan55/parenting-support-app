class RecordsController < ApplicationController
  def index
    question_ids = current_user.answer_completions.distinct.pluck(:question_id)
    questions = Question.where(id: question_ids)

    @records = questions.map do |question|
      {
        question: question,
        count: current_user.answer_completions.where(question_id: question.id).count,
        last_completed_on: current_user.answer_completions.where(question_id: question.id).maximum(:completed_on)
      }
    end
  end
end
