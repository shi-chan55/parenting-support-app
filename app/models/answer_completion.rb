class AnswerCompletion < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :question_id, uniqueness: {
    scope: [:user_id, :completed_on],
    message: "は今日すでに完了しています"
  }
end