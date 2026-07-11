class QuestionsController < ApplicationController
  def show
    @difficulty = params[:difficulty]
    @question = Question.where(difficulty: @difficulty).order(Arel.sql("RANDOM()")).first
  end

  def complete
    @difficulty = params[:difficulty]
    @question = Question.find(params[:question_id])
    @answer_completion = AnswerCompletion.new(
      user: current_user,
      question: @question,
      completed_on: Date.current
    )

    if @answer_completion.save
      redirect_to completion_path(@answer_completion)
    else
      render turbo_stream: turbo_stream.replace(
        "complete_button",
        partial: "questions/complete_button",
        locals: { question: @question, difficulty: @difficulty, error: @answer_completion.errors.full_messages.first }
      )
    end
  end
end