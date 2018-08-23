class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.references :question
      t.references :option
      t.integer :user_id
      t.timestamps
    end
    add_index :answers, [:question_id,:user_id], :unique=>true
    add_index :answers, :user_id
  end
end
