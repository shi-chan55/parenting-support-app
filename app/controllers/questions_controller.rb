class QuestionsController < ApplicationController
  def show
    @difficulty = params[:difficulty]
    @question = Question.where(difficulty: @difficulty).order(Arel.sql("RANDOM()")).first
  end
end