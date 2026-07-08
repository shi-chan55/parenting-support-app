class Question < ApplicationRecord
  has_many_attached :images
  
  has_many :answer_completions

  enum difficulty: { easy: "easy", normal: "normal", hard: "hard" }
end