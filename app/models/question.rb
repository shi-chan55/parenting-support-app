class Question < ApplicationRecord
  has_many_attached :images

  enum difficulty: { easy: "easy", normal: "normal", hard: "hard" }
end