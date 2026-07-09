class AddCompletedOnToAnswerCompletions < ActiveRecord::Migration[7.1]
  def change
    add_column :answer_completions, :completed_on, :date

    remove_index :answer_completions, [:user_id, :question_id]

    add_index :answer_completions, [:user_id, :question_id, :completed_on], unique: true
  end
end