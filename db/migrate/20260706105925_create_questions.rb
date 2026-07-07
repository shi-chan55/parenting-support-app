class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.text :hint
      t.text :parent_guide
      t.string :difficulty

      t.timestamps
    end
  end
end
