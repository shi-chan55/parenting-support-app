class CompletionsController < ApplicationController
  def show
    @answer_completion = current_user.answer_completions.find(params[:id])
    @question = @answer_completion.question
    @completion_count = current_user.answer_completions.where(question_id: @question.id).count
    @last_completed_on = current_user.answer_completions.where(question_id: @question.id).maximum(:completed_on)
  end
end